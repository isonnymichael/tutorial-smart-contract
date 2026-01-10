// SPDX-License-Identifier: GPL-3.0
// ^ License Identifier: Wajib ada di setiap file Solidity untuk kejelasan lisensi code

// Pragma: Menentukan versi compiler Solidity yang digunakan
// >=0.8.0 : Minimal versi 0.8.0
// <0.9.0  : Harus di bawah versi 0.9.0
pragma solidity >=0.8.0 <0.9.0;

// 'contract' mirip dengan 'class' di bahasa pemrograman lain (OOP)
contract HelloWorld {
    
    // Function untuk mengembalikan string "Hello, World!"
    // public  : Bisa dipanggil oleh siapa saja (user atau contract lain)
    // pure    : Function ini tidak membaca atau mengubah data di blockchain (stateless)
    // returns : Menentukan tipe data yang dikembalikan (string)
    // memory  : String disimpan sementara di memory (bukan storage/blockchain)
    function sayHello() public pure returns (string memory) {
        return "Hello, World!";
    }
}
