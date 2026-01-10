// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ArrayIntroduction {
    // --- 1. Array Basics ---
    
    // Dynamic Array: Ukurannya bisa berubah (bertambah/berkurang)
    uint256[] public dynamicArray;
    
    // Fixed Size Array: Ukurannya tetap, tidak bisa di-push
    uint256[5] public fixedArray;
    
    // Inisialisasi langsung
    uint256[] public initArray = [1, 2, 3];

    // --- 2. Operasi Array (CRUD) ---

    // Menambah data ke array (Push) - Hanya untuk dynamic array
    function push(uint256 _i) public {
        dynamicArray.push(_i);
    }

    // Membaca data dari index tertentu
    function get(uint256 _index) public view returns (uint256) {
        // Hati-hati: Jika index >= length, akan revert (out of bounds)
        return dynamicArray[_index];
    }

    // Mengupdate data di index tertentu
    function update(uint256 _index, uint256 _val) public {
        dynamicArray[_index] = _val;
    }

    // Menghapus data (Pop) - Menghapus elemen TERAKHIR
    function pop() public {
        dynamicArray.pop();
    }

    // Menghapus data dengan 'delete'
    // 'delete' TIDAK mengubah panjang array, hanya mereset nilai ke default (0)
    function remove(uint256 _index) public {
        delete dynamicArray[_index];
    }
    
    // Mendapatkan panjang array
    function getLength() public view returns (uint256) {
        return dynamicArray.length;
    }
    
    // --- 3. Looping Array ---
    
    // Menghitung total jumlah elemen array
    // Hati-hati: Loop array yang terlalu panjang bisa menghabiskan gas limit (Gas Limit Error)
    function sumArray() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i];
        }
        return sum;
    }
    
    // --- 4. Return Array ---
    // Mengembalikan seluruh array (hati-hati gas cost jika array besar)
    function getAll() public view returns (uint256[] memory) {
        return dynamicArray;
    }
}
