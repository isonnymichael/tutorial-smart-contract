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
    function setProfile(string memory _name, string memory _bio, uint256 _age) public {
        // Validasi input sederhana
        require(bytes(_name).length > 0, "Name cannot be empty");
        
        // Simpan data ke storage
        profiles[msg.sender] = UserProfile({
            displayName: _name,
            bio: _bio,
            age: _age,
            isActive: true
        });
        
    }

    // Get profile data
    // Mengembalikan struct secara langsung (Solidity 0.8+ support struct return)
    function getProfile(address _user) public view returns (UserProfile memory) {
        return profiles[_user];
    }
    
    // Update spesifik field (misal bio saja)
    function updateBio(string memory _newBio) public {
        require(profiles[msg.sender].isActive, "User not found");
        
        UserProfile storage user = profiles[msg.sender];
        user.bio = _newBio;
    }
    
    // Delete profile
    function deleteProfile() public {
        require(profiles[msg.sender].isActive, "User not found");
        
        // Menghapus data dari storage
        delete profiles[msg.sender];
    }
}
