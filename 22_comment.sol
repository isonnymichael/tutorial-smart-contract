// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// TODO: Tambahkan @title, @author, @notice, dan @dev
contract Komentar {
    
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

    // TODO: Tambahkan @notice dan @dev
    string public lastMessage;

    // TODO: Tambahkan @notice dan @param
    event MessageUpdated(address indexed sender, string message);

    // TODO: Tambahkan @notice, @dev, @param, dan @return
    function setMessage(string memory _newMessage) public returns (bool success) {
        lastMessage = _newMessage;
        
        emit MessageUpdated(msg.sender, _newMessage);
        
        return true;
    }

    // TODO: Tambahkan @notice, @dev, @param, dan @return
    function calculateSum(uint256 _a, uint256 _b) public pure returns (uint256 hasil) {
        return _a + _b;
    }
}
