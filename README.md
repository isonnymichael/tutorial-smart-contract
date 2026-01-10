# Tutorial Smart Contract

Repository ini berisi kode sumber dan materi pembelajaran dari seri tutorial Smart Contract di YouTube. Project ini dirancang untuk membimbing pemula dari nol hingga memahami konsep dasar, keamanan, dan standar industri Solidity.

## 📚 Daftar Materi Tutorial

### 🛠️ Bagian 1 — Persiapan & Tools
**1. Tutorial Smart Contract: Persiapan Development Environment**
- Tools yang dibutuhkan
- Install & setup MetaMask
- Wallet, private key, dan keamanan dasar
- Testnet & faucet
- Alur kerja developer smart contract

**2. Tutorial Smart Contract: Mengenal Remix IDE**
- Apa itu Remix IDE
- Tampilan & bagian penting Remix
- Cara compile contract
- Cara deploy contract (versi dasar)
- Cara interaksi dengan contract
> 🔎 **Catatan:** Mulai video ini, Remix dianggap sudah dipahami dan akan langsung dipakai.

### 🧱 Bagian 2 — Dasar Solidity (Wajib Kuat)
**3. Tutorial Smart Contract: Hello World**
- Struktur file .sol
- `pragma solidity`
- Contract pertama
- Compile & deploy (ulang singkat)
- Memanggil function

**4. Tutorial Smart Contract: Struktur Contract & Visibility**
- Struktur smart contract
- `public`, `private`, `internal`, `external`
- Getter otomatis
- Best practice penulisan kode
- `constructor`
- Inisialisasi state variable

**5. Tutorial Smart Contract: Variabel & Tipe Data**
- `uint`, `int`, `string`, `bool`
- `address`
- Default value
- Contoh penggunaan nyata

**6. Tutorial Smart Contract: Function, Parameter & Return Value**
- Function dengan parameter
- Return value
- `view` vs `pure`
- Naming convention

**7. Tutorial Smart Contract: Storage, Memory & Calldata**
- Perbedaan storage, memory, calldata
- Kapan pakai masing-masing
- Contoh aman untuk pemula

### 🔐 Bagian 3 — Validasi & Kontrol Akses
**8. Tutorial Smart Contract: Require & Error Handling**
- Validasi input
- Validasi address & saldo
- Error message yang benar
- Kesalahan umum pemula

**9. Tutorial Smart Contract: Modifier & Ownership**
- Konsep owner
- `modifier`
- `onlyOwner`
- Kontrol akses admin
- `msg.sender` sebagai identitas pemanggil

### 🧪 Studi Kasus 1 — Logic Dasar (Setelah Fondasi Kuat)
**10. Studi Kasus Smart Contract: Counter App**
- State variable
- Increment & decrement
- Validasi sederhana
- Update data di blockchain

### 📦 Bagian 4 — Struktur Data Solidity
**11. Tutorial Smart Contract: Array**
- Array statis & dinamis
- Push & read data
- Loop dasar
- Kapan array cocok digunakan

**12. Tutorial Smart Contract: Mapping**
- Mapping dasar
- Mapping `address => uint`
- Mapping vs array
- Contoh saldo user

**13. Tutorial Smart Contract: Struct & Nested Data**
- Struct
- Struct di mapping
- Struct di array
- Kombinasi data kompleks

### 🧪 Studi Kasus 2 — Data User
**14. Studi Kasus Smart Contract: Profile User**
- Simpan data user
- Update profile
- Mapping `address => struct`
- Akses data publik

### 📣 Bagian 5 — Event & Interaksi
**15. Tutorial Smart Contract: Event & Emit**
- Apa itu event
- Emit event
- Tracking aktivitas contract
- Event vs storage

### 🧪 Studi Kasus 3 — Hak Akses & Interaksi
**16. Studi Kasus Smart Contract: Voting System**
- Daftar kandidat
- User voting
- Cegah double vote
- Hitung hasil voting

### 💰 Bagian 6 — Smart Contract Finansial
**17. Tutorial Smart Contract: ETH Transfer & Payable**
- `payable`
- Terima ETH
- Kirim ETH
- Keamanan transfer
- `msg.value`
- Hubungan `msg.sender` & `msg.value`

### 🧪 Studi Kasus 4 — Finansial
**18. Studi Kasus Smart Contract: Crowdfunding**
- Donasi ETH
- Target dana
- Status campaign
- Withdraw oleh owner

### 🪙 Bagian 7 — Token & Standard Industri
**19. Studi Kasus Smart Contract: Token Sederhana (Manual)**
- Implementasi token dari nol
- Balance per user
- Transfer token
- Event transfer
- Keterbatasan token manual

**20. Tutorial Smart Contract: Standard Industri Token (OpenZeppelin)**
- Kenapa token manual tidak dipakai di production
- Mengenal OpenZeppelin Contracts
- Import & inheritance ERC20
- Mengganti token manual → OpenZeppelin ERC20
- Perbandingan manual vs OpenZeppelin
- Best practice penggunaan library
- Sekilas vulnerability umum (reentrancy, overflow)
- Kenapa OpenZeppelin lebih aman

## 🎯 Outcome
Setelah mengikuti tutorial ini, diharapkan Anda:
- Bisa menulis smart contract tanpa copy-paste
- Paham struktur, validasi, dan keamanan dasar
- Punya beberapa studi kasus nyata
- Siap menggunakan standard industri (OpenZeppelin)
