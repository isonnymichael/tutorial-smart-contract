/*
 * Studi Kasus: Menyimpan data profil user
 *
 * Tujuan:
 * - Latihan struct, mapping, dan manipulasi data user.
 *
 * Tugas:
 * 1. Buat struct UserProfile:
 *    - string displayName
 *    - string bio
 *    - uint256 age
 *    - bool isActive
 * 2. Buat mapping profiles:
 *    - mapping(address => UserProfile) public profiles;
 * 3. Function setProfile (public):
 *    - Parameter: string memory _name, string memory _bio, uint256 _age
 *    - Require nama tidak boleh kosong
 *    - Simpan data ke profiles[msg.sender] dengan isActive = true
 * 4. Function getProfile:
 *    - Parameter: address _user
 *    - Return: UserProfile memory
 *    - Kembalikan profiles[_user]
 * 5. Function updateBio:
 *    - Parameter: string memory _newBio
 *    - Require user sudah aktif (isActive == true)
 *    - Gunakan storage pointer untuk update bio
 * 6. Function deleteProfile:
 *    - Require user sudah aktif
 *    - Hapus data profile user dari mapping
 */
