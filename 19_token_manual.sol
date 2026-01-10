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
        // TODO: Hitung total supply dengan desimal
        
        // TODO: Assign ke balance msg.sender
        
    }

    // Fungsi Transfer
    // TODO: Buat function public bernama transfer yang menerima (address _to, uint256 _value) dan mengembalikan (bool success)
    // 1. Require balance sender cukup
    // 2. Require _to valid (tidak 0 address)
    // 3. Kurangi balance sender
    // 4. Tambah balance receiver
    // 5. Emit event Transfer
    // 6. Return true

    // Fungsi Approve (Memberi izin orang lain pakai token kita)
    // TODO: Buat function public bernama approve yang menerima (address _spender, uint256 _value) dan mengembalikan (bool success)
    // 1. Set allowance[msg.sender][_spender] = _value
    // 2. Emit event Approval
    // 3. Return true

    // Fungsi TransferFrom (Mengambil token orang lain yang sudah diapprove)
    // Biasa dipakai oleh contract DEX/Staking
    // TODO: Buat function public bernama transferFrom yang menerima (address _from, address _to, uint256 _value) dan mengembalikan (bool success)
    // 1. Require balance _from cukup
    // 2. Require allowance[_from][msg.sender] cukup
    // 3. Require _to valid
    // 4. Kurangi balance _from
    // 5. Tambah balance _to
    // 6. Kurangi allowance
    // 7. Emit event Transfer
    // 8. Return true
}
