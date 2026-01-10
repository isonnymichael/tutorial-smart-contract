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
    function addCar(string memory _model, uint256 _year) public {
        // Cara 1: Inisialisasi urut
        Car memory newCar = Car(_model, _year, msg.sender);
        cars.push(newCar);
        
        // Cara 2: Key-Value initialization (Lebih aman jika urutan properti berubah)
        Car memory myNewCar = Car({
            model: _model,
            year: _year,
            owner: msg.sender
        });
        
        // Simpan ke mapping
        carsByOwner[msg.sender] = myNewCar;
        
        // Update variable single struct
        myCar = myNewCar;
    }

    // Membaca struct dari array
    function getCar(uint256 _index) public view returns (string memory, uint256, address) {
        Car memory car = cars[_index];
        return (car.model, car.year, car.owner);
    }
    
    // Update properti spesifik dalam struct (di storage)
    function updateCarModel(uint256 _index, string memory _newModel) public {
        // Gunakan keyword 'storage' untuk mengupdate data asli di blockchain
        Car storage car = cars[_index];
        car.model = _newModel;
    }
    
    // Reset struct (delete)
    function deleteCar(uint256 _index) public {
        delete cars[_index]; // Mereset semua field ke default value
    }
}
