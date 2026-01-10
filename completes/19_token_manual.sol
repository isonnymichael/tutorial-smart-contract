// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

// Implementasi Token ERC-20 Sederhana (Manual)
// Ini hanya untuk pembelajaran, JANGAN DIPAKAI DI PRODUCTION!
// Gunakan OpenZeppelin untuk production.

contract ManualToken {
    string public name = "Manual Token";
    string public symbol = "MTK";
    uint8 public decimals = 18; // Standar 18 desimal (seperti ETH)
    uint256 public totalSupply;

    // Balance setiap user
    mapping(address => uint256) public balanceOf;
    
    // Allowance: Izin orang lain membelanjakan token kita
    // Owner -> Spender -> Amount
    mapping(address => mapping(address => uint256)) public allowance;

    // Event standar ERC20
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _initialSupply) {
        // Mint semua token ke deployer
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    // Fungsi Transfer
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        require(_to != address(0), "Invalid address");
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Fungsi Approve (Memberi izin orang lain pakai token kita)
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Fungsi TransferFrom (Mengambil token orang lain yang sudah diapprove)
    // Biasa dipakai oleh contract DEX/Staking
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");
        require(_to != address(0), "Invalid address");
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        // Kurangi jatah allowance
        allowance[_from][msg.sender] -= _value;
        
        emit Transfer(_from, _to, _value);
        return true;
    }
}
