// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract VariabelTipeData {
    
    // --- 1. Integer (Bilangan Bulat) ---
    // uint = Unsigned Integer (Hanya positif)
    // int  = Signed Integer (Positif dan Negatif)
    
    // uint (default) = uint256. 
    // Range: 0 sampai 2^256 - 1 (Sangat besar)
    uint256 public myBigNumber = 1000000;
    uint public myBigNumberAlias = 1000000; // Sama dengan uint256
    
    // uint8
    // Range: 0 sampai 2^8 - 1 (0 sampai 255)
    // Gunakan jika yakin angkanya TIDAK AKAN lebih dari 255.
    // Lebih hemat storage.
    uint8 public mySmallNumber = 250; 
    
    // uint16
    // Range: 0 sampai 2^16 - 1 (0 sampai 65,535)
    uint16 public myMediumNumber = 60000;
    
    // Variasi lain: uint32, uint64, uint128, dst (kelipatan 8)
    
    // int (Bisa negatif)
    // int256 range: -2^255 sampai 2^255 - 1
    int256 public myNegativeNumber = -500;
    
    
    // --- 2. String (Teks) ---
    // Menyimpan data teks. 
    // Di Solidity, manipulasi string cukup mahal (gas cost tinggi).
    string public myString = "Belajar Solidity";
    
    
    // --- 3. Boolean (Benar/Salah) ---
    // Hanya memiliki dua nilai: true atau false.
    // Biasa dipakai untuk logika percabangan (if/else).
    bool public isReady = true;
    bool public isPaused = false;
    
    
    // --- 4. Address (Alamat) ---
    // Menyimpan alamat wallet atau contract (20 bytes).
    // Contoh: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    address public myWalletAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    
    // --- 5. Default Values ---
    // Jika variabel dideklarasikan tanpa nilai awal, Solidity memberinya nilai default.
    
    uint256 public defaultUint; // Default: 0
    bool public defaultBool;    // Default: false
    address public defaultAddr; // Default: 0x0000000000000000000000000000000000000000
    string public defaultString; // Default: "" (string kosong)

    // --- 6. Global Variables (Special Variables) ---
    // Variabel yang disediakan oleh EVM (Ethereum Virtual Machine).
    // Berisi info blockchain, block, dan transaksi.

    // Contoh Function untuk melihat Global Variables
    function getGlobalInfo() public payable returns (address, uint, uint) {
        // msg.sender = Pengirim transaksi (Caller)
        // msg.value  = Jumlah ETH (Wei) yang dikirim
        // block.timestamp = Waktu saat ini (Unix Timestamp)
        return (msg.sender, msg.value, block.timestamp);
    }

    // Variabel Global Populer Lainnya:
    // - block.number   : Nomor blok saat ini
    // - block.chainid  : ID Chain (Mainnet/Testnet)
    // - tx.origin      : Pengirim ASLI transaksi (awal rantai call) -> Hati-hati menggunakannya!
}
