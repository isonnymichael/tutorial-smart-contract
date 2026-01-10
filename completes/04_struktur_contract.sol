// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract StrukturContract {
    // --- 1. State Variables & Visibility ---

    // PUBLIC:
    // - Bisa diakses dari luar contract (via getter otomatis)
    // - Bisa diakses dari dalam contract
    // - Solidity otomatis membuatkan function `myPublicNumber()`
    // Inisialisasi langsung (Direct Initialization):
    uint public myPublicNumber = 100; 

    // PRIVATE:
    // - HANYA bisa diakses dari dalam contract ini saja
    // - Tidak bisa diakses oleh contract turunan (inheritance)
    // - Tidak ada getter otomatis
    uint private myPrivateNumber;

    // INTERNAL:
    // - Bisa diakses dari dalam contract ini
    // - Bisa diakses oleh contract turunan (Inheritance)
    // - Default visibility untuk state variable adalah internal
    uint internal myInternalNumber = 50;


    // --- 2. Constructor & Inisialisasi ---
    
    // Constructor hanya berjalan SEKALI saat deployment
    // Digunakan untuk inisialisasi awal state variable
    constructor(uint256 _initialPrivateNumber) {
        myPrivateNumber = _initialPrivateNumber;
    }


    // --- 3. Function Visibility ---

    // PUBLIC Function:
    // Bisa dipanggil oleh siapa saja (user, contract lain, dan internal contract)
    function updateAll(uint256 _newVal) public {
        myPublicNumber = _newVal;
        myPrivateNumber = _newVal;
        myInternalNumber = _newVal;
        
        // Memanggil internal & private function dari sini diperbolehkan
        _internalHelper(); 
    }

    // EXTERNAL Function:
    // - HANYA bisa dipanggil dari LUAR contract
    // - Tidak bisa dipanggil langsung dari dalam contract ini (kecuali pakai this.functionName())
    function checkPublicNumber() external view returns (uint256) {
        return myPublicNumber;
    }

    // INTERNAL Function:
    // - Hanya bisa dipanggil dari dalam contract ini dan contract turunannya
    // - Biasanya diawali underscore (_) sebagai konvensi naming
    function _internalHelper() internal view returns (uint256) {
        return myInternalNumber + 1;
    }

    // PRIVATE Function:
    // - Hanya bisa dipanggil dari dalam contract ini saja
    // - Contract turunan pun TIDAK bisa mengaksesnya
    function _privateHelper() private view returns (uint256) {
        return myPrivateNumber;
    }
}
