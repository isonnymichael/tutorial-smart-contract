// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract EventIntroduction {
    // --- 1. Apa itu Event? ---
    // - Event adalah cara contract berkomunikasi dengan "Dunia Luar" (Frontend/Backend).
    // - Data event disimpan di log blockchain, BUKAN di storage contract.
    // - Jauh lebih murah gas-nya daripada menyimpan di storage.
    // - Smart contract TIDAK BISA membaca data event (hanya bisa menulis/emit).

    // Definisi Event
    // indexed: Memungkinkan pencarian (filtering) log berdasarkan parameter ini.
    // Maksimal 3 parameter indexed per event.
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event MessageSent(address indexed sender, string message);

    // --- 2. Emit Event ---
    
    function transferSimulated(address _to, uint256 _amount) public {
        // Logika transfer token/eth biasanya di sini...
        
        // Memicu event (Emit)
        emit Transfer(msg.sender, _to, _amount);
    }
    
    function sendMessage(string memory _msg) public {
        emit MessageSent(msg.sender, _msg);
    }
    
    // --- 3. Event vs Storage ---
    // Gunakan STORAGE jika data perlu dibaca lagi oleh smart contract (logic on-chain).
    // Gunakan EVENT jika data hanya perlu diketahui oleh user/frontend (history, notifikasi).
    
    // Contoh kasus: History transaksi
    // Jangan simpan history transaksi di array struct (mahal gas), cukup emit event.
    // Frontend bisa query event logs untuk menampilkan history.
}
