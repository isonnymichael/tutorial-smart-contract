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
        // Logic saat menerima ETH
    }

    // Function special 'fallback'
    // Dipanggil jika contract menerima data yang tidak cocok dengan function manapun
    fallback() external payable {
        // Logic fallback
    }

    // Function biasa dengan modifier 'payable'
    // Bisa menerima ETH bersamaan dengan pemanggilan function
    function deposit() public payable {
        // msg.value adalah jumlah WEI yang dikirim
        require(msg.value > 0, "Must send ETH");
    }

    // Cek saldo contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // --- 2. Mengirim Ether ---

    // Cara 1: Transfer (Tidak disarankan lagi)
    // - Gas limit fix 2300 (cukup untuk log event, tidak cukup untuk logic kompleks)
    // - Jika gagal, otomatis revert
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    // Cara 2: Send (Tidak disarankan lagi)
    // - Gas limit fix 2300
    // - Jika gagal, return false (TIDAK revert otomatis)
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    // Cara 3: Call (Recommended)
    // - Gas limit fleksibel (forward semua gas atau custom)
    // - Return (bool success, bytes memory data)
    // - Aman dari reentrancy jika dikombinasikan dengan pattern Check-Effects-Interactions
    function sendViaCall(address payable _to) public payable {
        // Syntax agak unik: (bool success, ) = recipient.call{value: amount}("")
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Failed to send Ether");
    }
}
