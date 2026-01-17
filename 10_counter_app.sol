/*
 * Studi kasus: Counter app
 *
 * Tujuan:
 * - Latihan state variable, constructor, modifier, dan error handling.
 *
 * Tugas:
 * 1. State variable:
 *    - Buat int256 public count
 *    - Buat address public owner untuk menyimpan address pemilik contract
 * 2. Constructor:
 *    - Set count = 0
 *    - Set owner = msg.sender
 * 3. Modifier onlyOwner:
 *    - Validasi msg.sender == owner
 * 4. Function inc (public):
 *    - Pastikan count < 100 (require)
 *    - Tambah nilai count
 * 5. Function dec (public, hanya owner):
 *    - Gunakan modifier onlyOwner
 *    - Kurangi nilai count
 * 6. Function setCount:
 *    - Jika _newCount < 0, revert dengan pesan "Counter tidak boleh negatif"
 *    - Jika valid, update count ke _newCount
 * 7. Function reset (hanya owner):
 *    - Tambahkan modifier onlyOwner
 *    - Reset count menjadi 0
 */
