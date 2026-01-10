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
        MyStruct storage myStruct = myStructs[1];
        myStruct.foo = 20; // myStructs[1].foo sekarang jadi 20
        
        // MEMORY COPY:
        // readOnlyStruct adalah COPY dari data storage ke memory sementara.
        // Jika readOnlyStruct diubah, data di storage blockchain TIDAK BERUBAH.
        MyStruct memory readOnlyStruct = myStructs[1];
        readOnlyStruct.foo = 30; // Hanya berubah di memory fungsi ini saja
    }

    // --- 2. Calldata ---
    
    // CALLDATA:
    // - Mirip memory, tapi read-only (tidak bisa diubah).
    // - Wajib digunakan untuk parameter tipe reference (string, array, struct) pada function EXTERNAL.
    // - Lebih hemat gas daripada memory karena tidak perlu menyalin data.
    
    function exampleExternal(string calldata _text, uint256[] calldata _numbers) external pure returns (string calldata) {
        // _text = "New"; // ERROR: Calldata tidak bisa diubah
        return _text;
    }
    
    // Memory digunakan jika data perlu dimanipulasi di dalam function
    function examplePublic(string memory _text) public pure {
        // _text bisa diubah di sini, tapi perubahan tidak disimpan ke blockchain (hanya lokal function)
    }
}
