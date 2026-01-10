// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    // 1. State Variable
    int256 public count;
    address public owner; // Menyimpan address owner contract

    // 2. Constructor
    constructor() {
        // TODO: Set count = 0
        // TODO: Set owner = msg.sender
        
    }

    // 3. Modifier (Materi 09: Modifier & Ownership)
    // Membatasi akses function hanya untuk owner
    modifier onlyOwner() {
        // TODO: Validasi msg.sender == owner
        
        _;
    }

    // 4. Functions

    // Public: Siapa saja bisa menambah angka
    // TODO: Buat function public bernama inc
    // Isinya: require count < 100, lalu tambah count
    

    // Restricted: Hanya owner yang bisa mengurangi angka
    // (Penerapan Modifier onlyOwner)
    // TODO: Buat function public bernama dec yang menggunakan modifier onlyOwner
    // Isinya: kurangi count
    
    
    // Fungsi untuk mengubah angka langsung dengan validasi
    function setCount(int256 _newCount) public {
        // Validasi: Tidak boleh negatif
        if (_newCount < 0) {
            // (Materi 08: Error Handling dengan revert)
            // TODO: Revert dengan pesan "Counter tidak boleh negatif"
            
        }
        
        // TODO: Update count
        
    }
    
    // Fungsi reset khusus owner
    // TODO: Tambahkan modifier onlyOwner
    function reset() public {
        // TODO: Reset count jadi 0
        
    }
}
