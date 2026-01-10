// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ModifierOwnership {
    // State variable untuk menyimpan alamat pemilik contract
    address public owner;
    uint256 public x = 10;
    bool public locked;

    // Constructor berjalan sekali saat deploy
    constructor() {
        // Set deployer sebagai owner
        owner = msg.sender;
    }

    // --- 1. Modifier Dasar ---
    
    // Modifier adalah kode tambahan yang bisa ditempelkan ke function.
    // Biasa dipakai untuk cek hak akses (access control).
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore (_) adalah tempat dimana body function asli akan dieksekusi
        _;
    }

    // --- 2. Menggunakan Modifier ---
    
    // Function ini hanya bisa dipanggil oleh owner
    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    // Function ini bisa dipanggil siapa saja karena tidak ada modifier onlyOwner
    function changeX(uint256 _x) public {
        x = _x;
    }

    // --- 3. Modifier dengan Parameter & Reentrancy Guard sederhana ---
    
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // Modifier untuk mencegah function dipanggil lagi saat sedang berjalan (Reentrancy Guard)
    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 _i) public noReentrancy {
        x -= _i;
        if (_i > 1) {
            // Contoh reentrancy attack simulation (memanggil diri sendiri)
            // decrement(_i - 1); 
        }
    }
}
