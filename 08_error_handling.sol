// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ErrorHandling {
    
    // --- 1. Require ---
    // Paling sering digunakan.
    // Digunakan untuk:
    // - Validasi input (parameter function)
    // - Validasi kondisi sebelum eksekusi logic (Preconditions)
    // - Mengembalikan sisa gas ke user jika error
    
    function testRequire(uint256 _i) public pure {
        // TODO: Gunakan require untuk memastikan _i > 10. Jika tidak, tampilkan pesan error "Input must be greater than 10"
        
    }
    
    // --- 2. Revert ---
    // Mirip require, tapi digunakan untuk logic yang lebih kompleks (misal if/else bertingkat).
    // Mengembalikan sisa gas.
    
    // TODO: Buat function pure bernama testRevert yang menerima parameter uint256 _i
    // Gunakan if dan revert: Jika _i <= 10, revert dengan pesan "Input must be greater than 10"
    
    
    // Custom Error (Hemat Gas - Solidity 0.8.4+)
    // Lebih hemat gas daripada string error message panjang
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 balance = address(this).balance;
        
        // TODO: Jika balance < _withdrawAmount, revert menggunakan custom error InsufficientBalance
        
    }
    
    // --- 3. Assert ---
    // Digunakan untuk mengecek kondisi yang SEHARUSNYA TIDAK PERNAH SALAH (Internal Error).
    // Contoh: Invarian matematika, bug di kode.
    // Jika assert gagal, semua gas akan hangus (sebelum Solidity 0.8.0, sekarang revert panic code).
    
    uint256 public num = 123;
    
    function testAssert() public view {
        // Jika num tiba-tiba 0, berarti ada bug parah di kode lain yang mengubah num
        // TODO: Gunakan assert untuk memastikan num == 123
        
    }
}
