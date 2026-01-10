// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Crowdfunding {
    // Studi Kasus: Penggalangan Dana (Donasi)
    
    address public owner;
    uint256 public targetAmount;
    uint256 public deadline;
    uint256 public raisedAmount;
    uint256 public minDonation;
    
    // Mapping donatur
    mapping(address => uint256) public donations;
    
    event Donated(address indexed donor, uint256 amount);
    event Withdrawn(uint256 amount);
    
    constructor(uint256 _targetAmount, uint256 _durationInMinutes) {
        owner = msg.sender;
        targetAmount = _targetAmount;
        // block.timestamp adalah waktu saat ini (dalam detik unix epoch)
        deadline = block.timestamp + (_durationInMinutes * 1 minutes);
        minDonation = 0.0001 ether; // Set default minimal donasi
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    modifier campaignOpen() {
        require(block.timestamp < deadline, "Campaign ended");
        _;
    }
    
    modifier campaignFinished() {
        require(block.timestamp >= deadline, "Campaign still running");
        _;
    }

    // Donasi ETH
    function donate() public payable campaignOpen {
        require(msg.value >= minDonation, "Donation must be >= minDonation");
        
        donations[msg.sender] += msg.value;
        raisedAmount += msg.value;
        
        emit Donated(msg.sender, msg.value);
    }
    
    // Withdraw oleh owner jika target tercapai atau campaign selesai
    // (Simplifikasi: Boleh withdraw kapan saja asal owner, di real case mungkin ada syarat sukses)
    function withdraw() public onlyOwner {
        require(raisedAmount >= targetAmount, "Target not reached");
        
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");
        
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Transfer failed");
        
        emit Withdrawn(balance);
    }
    
    // Refund jika campaign gagal
    function refund() public campaignFinished {
        require(raisedAmount < targetAmount, "Campaign succeeded, no refund");
        uint256 donated = donations[msg.sender];
        require(donated > 0, "No donation to refund");
        
        // Reset balance dulu sebelum transfer (Check-Effects-Interactions Pattern)
        // Mencegah Reentrancy Attack
        donations[msg.sender] = 0;
        
        (bool success, ) = payable(msg.sender).call{value: donated}("");
        require(success, "Refund failed");
    }
    
    // Helper info sisa waktu
    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return deadline - block.timestamp;
    }
}
