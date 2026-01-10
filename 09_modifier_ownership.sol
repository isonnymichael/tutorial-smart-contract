// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ModifierOwnership {
    // State variable untuk menyimpan alamat pemilik contract
    address public owner;
    uint256 public x = 10;
    bool public locked;

    // Constructor berjalan sekali saat deploy
    constructor() {
        // TODO: Set msg.sender sebagai owner
        
    }

    // --- 1. Modifier Dasar ---
    
    // Modifier adalah kode tambahan yang bisa ditempelkan ke function.
    // Biasa dipakai untuk cek hak akses (access control).
    // TODO: Buat modifier bernama onlyOwner
    // Isinya: require msg.sender == owner, dan jangan lupa underscore "_;"
    

    // --- 2. Menggunakan Modifier ---
    
    // Function ini hanya bisa dipanggil oleh owner
    // TODO: Buat function changeOwner yang menerima address _newOwner dan menggunakan modifier onlyOwner
    // Isinya: Validasi _newOwner != address(0) dan update owner
    

    // Function ini bisa dipanggil siapa saja karena tidak ada modifier onlyOwner
    function changeX(uint256 _x) public {
        x = _x;
    }

    // --- 3. Modifier dengan Parameter & Reentrancy Guard sederhana ---
    
    modifier validAddress(address _addr) {
        // TODO: Require _addr bukan address(0)
        
        _;
    }

    // Modifier untuk mencegah function dipanggil lagi saat sedang berjalan (Reentrancy Guard)
    modifier noReentrancy() {
        // TODO: Require !locked
        
        // TODO: Set locked = true
        
        _;
        // TODO: Set locked = false
        
    }

    function decrement(uint256 _i) public noReentrancy {
        x -= _i;
        if (_i > 1) {
            // Contoh reentrancy attack simulation (memanggil diri sendiri)
            // decrement(_i - 1); 
        }
    }
}
