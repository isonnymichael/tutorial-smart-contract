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
        // Jika _i <= 10, error akan muncul dengan pesan "Input must be greater than 10"
        require(_i > 10, "Input must be greater than 10");
    }
    
    // --- 2. Revert ---
    // Mirip require, tapi digunakan untuk logic yang lebih kompleks (misal if/else bertingkat).
    // Mengembalikan sisa gas.
    
    function testRevert(uint256 _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }
    
    // Custom Error (Hemat Gas - Solidity 0.8.4+)
    // Lebih hemat gas daripada string error message panjang
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 balance = address(this).balance;
        
        if (balance < _withdrawAmount) {
            // Revert dengan data parameter
            revert InsufficientBalance(balance, _withdrawAmount);
        }
    }
    
    // --- 3. Assert ---
    // Digunakan untuk mengecek kondisi yang SEHARUSNYA TIDAK PERNAH SALAH (Internal Error).
    // Contoh: Invarian matematika, bug di kode.
    // Jika assert gagal, semua gas akan hangus (sebelum Solidity 0.8.0, sekarang revert panic code).
    
    uint256 public num = 123;
    
    function testAssert() public view {
        // Jika num tiba-tiba 0, berarti ada bug parah di kode lain yang mengubah num
        assert(num == 123);
    }
}
