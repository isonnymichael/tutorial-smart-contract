// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract DataLocation {
    // STORAGE:
    // - Data disimpan permanen di blockchain.
    // - State variables (di luar function) SELALU storage.
    uint256[] public arr;
    mapping(uint256 => address) map;
    
    struct MyStruct {
        uint256 foo;
    }
    
    mapping(uint256 => MyStruct) public myStructs;

    // --- 1. Storage vs Memory ---

    function f() public {
        // Mengisi data dummy
        myStructs[1] = MyStruct(10);

        // STORAGE POINTER:
        // myStruct sekarang menunjuk langsung ke storage myStructs[1]
        // Jika myStruct diubah, data di storage blockchain IKUT BERUBAH.
        // TODO: Buat variable 'storage' pointer ke myStructs[1] dan ubah nilainya
        
        
        // MEMORY COPY:
        // readOnlyStruct adalah COPY dari data storage ke memory sementara.
        // Jika readOnlyStruct diubah, data di storage blockchain TIDAK BERUBAH.
        // TODO: Buat variable 'memory' copy dari myStructs[1] dan ubah nilainya (cek apakah storage berubah?)
        
    }

    // --- 2. Calldata ---
    
    // CALLDATA:
    // - Mirip memory, tapi read-only (tidak bisa diubah).
    // - Wajib digunakan untuk parameter tipe reference (string, array, struct) pada function EXTERNAL.
    // - Lebih hemat gas daripada memory karena tidak perlu menyalin data.
    
    // TODO: Buat function external pure bernama exampleExternal
    // Menerima parameter: string calldata _text, uint256[] calldata _numbers
    // Mengembalikan: string calldata
    // Function ini hanya me-return _text
    
    
    // Memory digunakan jika data perlu dimanipulasi di dalam function
    function examplePublic(string memory _text) public pure {
        // _text bisa diubah di sini, tapi perubahan tidak disimpan ke blockchain (hanya lokal function)
    }
}
