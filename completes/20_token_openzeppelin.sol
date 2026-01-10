// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

// --- STANDARD INDUSTRI (OpenZeppelin) ---

// Cara Import di Remix:
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// (Remix otomatis mengambil dari GitHub/NPM)

// Untuk simulasi lokal tanpa NPM install, kita anggap import ini ada.
// Di project real (Hardhat/Foundry), install dulu: npm install @openzeppelin/contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Contract kita mewarisi (inherit) fungsionalitas ERC20 standar
contract MyToken is ERC20 {
    
    // Constructor
    // Memanggil constructor parent (ERC20) dengan nama dan simbol
    constructor(uint256 _initialSupply) ERC20("Gold Token", "GLD") {
        
        // _mint adalah fungsi internal dari ERC20.sol
        // Mencetak token baru ke alamat deployer (msg.sender)
        // Ingat: _initialSupply belum memperhitungkan desimal
        // 10**decimals() mengembalikan 10 pangkat 18 (default)
        _mint(msg.sender, _initialSupply * (10 ** decimals()));
    }
    
    // Kenapa OpenZeppelin?
    // 1. Teruji (Audited): Sudah dipakai ribuan project besar.
    // 2. Aman: Menangani edge cases, overflow (versi lama), dan standar compliance.
    // 3. Efisien: Gas optimized.
    // 4. Fitur Lengkap: Burnable, Pausable, Cappable, dll tinggal import extension.
}
