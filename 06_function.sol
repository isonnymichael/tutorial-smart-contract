// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract FunctionIntroduction {
    // --- 1. Function Basic ---
    
    // Function untuk penjumlahan
    // Parameter: _x dan _y (input)
    // Returns: Mengembalikan nilai uint256
    // pure: Tidak membaca atau mengubah state variable (hanya hitungan matematika)
    function add(uint256 _x, uint256 _y) public pure returns (uint256) {
        // TODO: Kembalikan hasil penjumlahan _x dan _y
        
    }

    // --- 2. View vs Pure ---
    
    uint256 public number = 10;

    // VIEW:
    // Function ini MEMBACA state variable (number), tapi TIDAK mengubahnya.
    function addToNumber(uint256 _x) public view returns (uint256) {
        // TODO: Kembalikan hasil penjumlahan number (state variable) dengan _x
        
    }

    // PURE:
    // Function ini TIDAK membaca dan TIDAK mengubah state variable.
    // Hanya bergantung pada parameter input.
    // TODO: Buat function pure bernama multiply yang menerima 2 parameter uint256 dan mengembalikan hasil perkaliannya
    
    
    // --- 3. Return Values ---
    
    // Function bisa mengembalikan banyak nilai (Multiple Returns)
    // TODO: Buat function bernama getManyValues yang mengembalikan (uint256, bool, string memory)
    // Return valuenya: (1, true, "Hello")
    

    // Destructuring assignment (cara mengambil return value)
    // Ini contoh function yang memanggil function di atas
    function processValues() public pure {
        // TODO: Panggil getManyValues() dan simpan hasilnya ke dalam variabel a, b, dan c
        // (uint256 a, bool b, string memory c) = ...
        
    }
}
