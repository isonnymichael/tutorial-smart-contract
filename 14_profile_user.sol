// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ProfileUser {
    // Studi Kasus: Menyimpan data profil user
    
    // Struct untuk menyimpan detail user
    struct UserProfile {
        string displayName;
        string bio;
        uint256 age;
        bool isActive;
    }
    
    // Mapping dari address wallet ke struct UserProfile
    // Ini cara standar menyimpan data user di smart contract
    mapping(address => UserProfile) public profiles;

    // --- Functions ---

    // Create atau Update profile
    // TODO: Buat function public bernama setProfile yang menerima (string memory _name, string memory _bio, uint256 _age)
    // 1. Require nama tidak boleh kosong
    // 2. Simpan data ke mapping profiles[msg.sender] (isActive = true)
    

    // Get profile data
    // Mengembalikan struct secara langsung (Solidity 0.8+ support struct return)
    function getProfile(address _user) public view returns (UserProfile memory) {
        // TODO: Kembalikan profile dari _user
        
    }
    
    // Update spesifik field (misal bio saja)
    function updateBio(string memory _newBio) public {
        // TODO: Require user sudah aktif (isActive == true)
        
        
        // TODO: Update bio user (gunakan storage pointer)
        
    }
    
    // Delete profile
    // TODO: Buat function public bernama deleteProfile
    // 1. Require user sudah aktif
    // 2. Hapus data profile user dari mapping
    
}
