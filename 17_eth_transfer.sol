// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract EthTransfer {
    /* 
     * PENJELASAN SATUAN ETHER:
     * Solidity menggunakan integer (bilangan bulat), tidak ada float/desimal.
     * Oleh karena itu, satuan mata uang dibagi menjadi unit terkecil:
     * 
     * 1 wei     = 1 (unit terkecil)
     * 1 gwei    = 1e9 wei = 1,000,000,000 wei (biasa untuk gas price)
     * 1 ether   = 1e18 wei = 1,000,000,000,000,000,000 wei
     */
    
    // Variabel pembantu untuk mengecek nilai satuan
    uint public constant ONE_WEI = 1 wei;
    uint public constant ONE_GWEI = 1 gwei;
    uint public constant ONE_ETHER = 1 ether;

    // Function untuk menerima Ether
    // msg.value otomatis dalam satuan WEI
    
    // Function special 'receive'
    // Dipanggil jika contract menerima ETH kosong (tanpa data calldata)
    receive() external payable {
        // Logic saat menerima ETH (kosongkan saja untuk tutorial ini)
    }

    // Function special 'fallback'
    // Dipanggil jika contract menerima data yang tidak cocok dengan function manapun
    fallback() external payable {
        // Logic fallback (kosongkan saja)
    }

    // Function biasa dengan modifier 'payable'
    // Bisa menerima ETH bersamaan dengan pemanggilan function
    // TODO: Buat function public payable bernama deposit
    // Function ini harus memvalidasi msg.value > 0 menggunakan require

    // Cek saldo contract
    function getBalance() public view returns (uint256) {
        // TODO: Kembalikan saldo contract ini (address(this).balance)
        
    }

    // --- 2. Mengirim Ether ---

    // Cara 1: Transfer (Tidak disarankan lagi)
    // - Gas limit fix 2300 (cukup untuk log event, tidak cukup untuk logic kompleks)
    // - Jika gagal, otomatis revert
    function sendViaTransfer(address payable _to) public payable {
        // TODO: Kirim msg.value ke _to menggunakan transfer
        
    }

    // Cara 2: Send (Tidak disarankan lagi)
    // - Gas limit fix 2300
    // - Jika gagal, return false (TIDAK revert otomatis)
    function sendViaSend(address payable _to) public payable {
        // TODO: Kirim msg.value ke _to menggunakan send
        // TODO: Require hasil kirim sukses
        
    }

    // Cara 3: Call (Recommended)
    // - Gas limit fleksibel (forward semua gas atau custom)
    // - Return (bool success, bytes memory data)
    // - Aman dari reentrancy jika dikombinasikan dengan pattern Check-Effects-Interactions
    // TODO: Buat function public payable bernama sendViaCall yang menerima parameter address payable _to
    // Function ini harus mengirim msg.value ke _to menggunakan method .call
    // Syntax: (bool success, ) = recipient.call{value: amount}("")
    // Jangan lupa require success is true
}
