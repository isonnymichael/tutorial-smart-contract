// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract MappingIntroduction {
    // --- 1. Konsep Dasar Mapping ---
    
    // Mapping seperti "Dictionary" di Python atau "HashMap" di Java.
    // Format: mapping(keyType => valueType)
    // Key: Hampir semua tipe data (kecuali struct, array, mapping)
    // Value: Bisa tipe apa saja (termasuk struct, array, mapping)
    
    // Contoh: Menyimpan saldo user (Address -> Uint)
    mapping(address => uint256) public balances;
    
    // Contoh: Menyimpan status teman (Address -> Bool)
    mapping(address => bool) public isFriend;

    // --- 2. Operasi Mapping ---

    // Menambah/Update data
    // TODO: Buat function public bernama setBalance yang menerima (address _addr, uint256 _amount)
    // Function ini mengupdate balances[_addr] = _amount
    

    // Membaca data
    // Jika key tidak ada, mapping akan mengembalikan DEFAULT VALUE (0 untuk uint)
    function getBalance(address _addr) public view returns (uint256) {
        // TODO: Kembalikan saldo _addr dari mapping balances
        
    }

    // Menghapus data (Reset ke default value)
    // TODO: Buat function public bernama removeBalance yang menerima address _addr
    // Function ini menghapus data _addr dari balances
    

    // --- 3. Nested Mapping (Mapping di dalam Mapping) ---
    
    // Contoh: Token approval (Owner -> Spender -> Amount)
    mapping(address => mapping(address => uint256)) public allowance;
    
    function setAllowance(address _spender, uint256 _amount) public {
        // msg.sender memberikan izin ke _spender sebanyak _amount
        // TODO: Set allowance dari msg.sender ke _spender menjadi _amount
        
    }
    
    function getAllowance(address _owner, address _spender) public view returns (uint256) {
        // TODO: Kembalikan allowance dari _owner ke _spender
        
    }
    
    // --- 4. Mapping vs Array ---
    // - Mapping TIDAK BISA di-looping (tidak ada index urut, tidak ada length).
    // - Jika butuh iterasi/looping, gunakan Array atau kombinasikan Mapping + Array.
    // - Mapping lebih hemat gas untuk pencarian data (O(1)).
}
