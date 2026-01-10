// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    // 1. State Variable
    int256 public count;
    address public owner; // Menyimpan address owner contract

    // 2. Constructor
    constructor() {
        count = 0;
        owner = msg.sender; // Set yang deploy contract sebagai owner
    }

    // 3. Modifier (Materi 09: Modifier & Ownership)
    // Membatasi akses function hanya untuk owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Kamu bukan owner!");
        _;
    }

    // 4. Functions

    // Public: Siapa saja bisa menambah angka
    function inc() public {
        // Validasi logic bisnis: Maksimal angka 100
        // (Materi 08: Error Handling dengan require)
        require(count < 100, "Counter sudah mencapai batas maksimal 100");
        
        count += 1;
    }

    // Restricted: Hanya owner yang bisa mengurangi angka
    // (Penerapan Modifier onlyOwner)
    function dec() public onlyOwner {
        count -= 1;
    }
    
    // Fungsi untuk mengubah angka langsung dengan validasi
    function setCount(int256 _newCount) public {
        // Validasi: Tidak boleh negatif
        if (_newCount < 0) {
            // (Materi 08: Error Handling dengan revert)
            revert("Counter tidak boleh negatif");
        }
        
        count = _newCount;
    }
    
    // Fungsi reset khusus owner
    function reset() public onlyOwner {
        count = 0;
    }
}
