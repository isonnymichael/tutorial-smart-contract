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
        // TODO: Set owner
        
        // TODO: Set targetAmount
        
        // TODO: Set deadline (block.timestamp + duration)
        
        // TODO: Set minDonation (misal 0.0001 ether)
        
    }
    
    modifier onlyOwner() {
        // TODO: Buat logic modifier ini
        // Check msg.sender == owner
        // Gunakan underscore "_;"
        
    }
    
    modifier campaignOpen() {
        // TODO: Check deadline belum lewat
        
        _;
    }
    
    modifier campaignFinished() {
        // TODO: Check deadline sudah lewat
        
        _;
    }

    // Donasi ETH
    // TODO: Buat function public payable bernama donate yang menggunakan modifier campaignOpen
    // 1. Require msg.value >= minDonation
    // 2. Update mapping donations untuk msg.sender
    // 3. Update raisedAmount
    // 4. Emit event Donated
    
    // Withdraw oleh owner jika target tercapai atau campaign selesai
    // (Simplifikasi: Boleh withdraw kapan saja asal owner, di real case mungkin ada syarat sukses)
    // TODO: Buat function public bernama withdraw yang menggunakan modifier onlyOwner
    // 1. Require raisedAmount >= targetAmount
    // 2. Cek contract balance > 0
    // 3. Transfer balance ke owner (gunakan .call)
    // 4. Emit event Withdrawn
    
    // Refund jika campaign gagal
    function refund() public campaignFinished {
        // TODO: Require raisedAmount < targetAmount (campaign gagal)
        
        // TODO: Ambil jumlah donasi user
        
        // TODO: Require donasi > 0
        
        
        // Reset balance dulu sebelum transfer (Check-Effects-Interactions Pattern)
        // Mencegah Reentrancy Attack
        // TODO: Set donations[msg.sender] = 0
        
        
        // TODO: Refund ke user (gunakan call)
        
    }
    
    // Helper info sisa waktu
    function timeLeft() public view returns (uint256) {
        // TODO: Jika sudah lewat deadline, return 0
        
        // TODO: Return deadline - block.timestamp
        
    }
}
