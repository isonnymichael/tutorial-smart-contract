// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract StructIntroduction {
    // --- 1. Definisi Struct ---
    
    // Struct memungkinkan kita membuat tipe data custom
    // yang membungkus beberapa data terkait.
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    // --- 2. Menggunakan Struct ---
    
    // Single Struct
    Car public myCar;
    
    // Array of Struct
    Car[] public cars;
    
    // Mapping of Struct (Sangat umum digunakan)
    mapping(address => Car) public carsByOwner;

    // --- 3. Operasi Struct ---

    // Menambah data struct
    // TODO: Buat function public bernama addCar yang menerima (string memory _model, uint256 _year)
    // 1. Buat struct Car baru
    // 2. Push ke array cars
    // 3. Simpan ke mapping carsByOwner (key: msg.sender)
    // 4. Update variable myCar
    

    // Membaca struct dari array
    function getCar(uint256 _index) public view returns (string memory, uint256, address) {
        // TODO: Ambil struct dari array cars pada index _index
        
        // TODO: Return (model, year, owner)
        
    }
    
    // Update properti spesifik dalam struct (di storage)
    function updateCarModel(uint256 _index, string memory _newModel) public {
        // Gunakan keyword 'storage' untuk mengupdate data asli di blockchain
        // TODO: Ambil struct dari array cars pada index _index sebagai storage
        
        // TODO: Update model menjadi _newModel
        
    }
    
    // Reset struct (delete)
    // TODO: Buat function public bernama deleteCar yang menerima uint256 _index
    // Function ini menghapus struct dari array cars pada index tersebut
    
}
