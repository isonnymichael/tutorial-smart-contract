// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * @title Materi 22: Komentar dan NatSpec (Natural Specification)
 * @author Tutorial Solidity Indonesia
 * @notice Contract ini mendemonstrasikan cara penggunaan komentar standar dan NatSpec
 * @dev NatSpec sangat PENTING karena:
 *      1. Menghasilkan dokumentasi otomatis untuk developer lain.
 *      2. Ditampilkan di UI (seperti Etherscan, Remix, atau Wallet) saat user berinteraksi.
 *      3. Membantu audit keamanan dengan menjelaskan "intent" (tujuan) dari kode.
 */
contract KomentarDanNatSpec {
    
    // --- JENIS KOMENTAR ---

    // 1. Single-line comment (Garis miring ganda)
    // Digunakan untuk penjelasan singkat di dalam kode.

    /*
     * 2. Multi-line comment
     * Digunakan untuk penjelasan yang lebih panjang
     * atau menonaktifkan blok kode sementara.
     */

    // --- NATSPEC (Natural Specification) ---
    // Dimulai dengan /// (tiga garis miring) atau /** ... */
    // Tag yang sering digunakan:
    // @title  : Judul contract
    // @author : Nama pembuat
    // @notice : Penjelasan fungsi untuk USER (non-teknis)
    // @dev    : Penjelasan detail untuk DEVELOPER (teknis)
    // @param  : Menjelaskan parameter fungsi
    // @return : Menjelaskan nilai kembalian

    /// @notice Menyimpan pesan terakhir yang dikirim user
    /// @dev Variabel ini bersifat public, getter otomatis dibuat
    string public lastMessage;

    /// @notice Event yang dipicu saat pesan diperbarui
    /// @param sender Alamat pengirim pesan
    /// @param message Isi pesan baru
    event MessageUpdated(address indexed sender, string message);

    /// @notice Mengubah pesan yang tersimpan di contract
    /// @dev Fungsi ini tidak memiliki validasi panjang string, hati-hati gas limit
    /// @param _newMessage Pesan baru yang ingin disimpan
    /// @return success Status keberhasilan operasi
    function setMessage(string memory _newMessage) public returns (bool success) {
        // Komentar biasa: Update state variable
        lastMessage = _newMessage;
        
        // Emit event
        emit MessageUpdated(msg.sender, _newMessage);
        
        return true;
    }

    /// @notice Menghitung penjumlahan dua angka
    /// @dev Pure function karena tidak membaca/menulis state
    /// @param _a Angka pertama
    /// @param _b Angka kedua
    /// @return hasil Hasil penjumlahan _a dan _b
    function calculateSum(uint256 _a, uint256 _b) public pure returns (uint256 hasil) {
        return _a + _b;
    }
}
