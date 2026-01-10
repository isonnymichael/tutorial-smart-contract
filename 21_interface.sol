// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// Interface digunakan untuk berinteraksi dengan contract lain.
// Contoh kasus: Kita ingin smart contract kita bisa mengecek saldo USDT user atau mengirim token USDT.

// Definisi Interface untuk ERC20 (Standard Token seperti USDT, USDC, DAI)
interface IERC20 {
    // Interface hanya mendefinisikan nama fungsi, parameter, dan return value.
    // Tidak ada implementasi logika (body function).
    
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract TokenInteraction {
    // Alamat Contract USDT (Contoh di jaringan Sepolia/Mainnet)
    // Pastikan mengganti alamat ini dengan alamat token yang valid saat deployment
    address public usdtAddress;

    constructor(address _usdtAddress) {
        usdtAddress = _usdtAddress;
    }

    // Fungsi untuk mengecek saldo USDT dari address tertentu
    // TODO: Buat function public view bernama getUserUSDTBalance yang menerima (address _user) dan mengembalikan (uint256)
    // 1. Buat instance IERC20 dari usdtAddress
    // 2. Return balanceOf user dari contract USDT

    // Fungsi untuk mengirim USDT dari contract ini ke user lain
    // (Contract ini harus punya saldo USDT dulu)
    // TODO: Buat function public bernama sendUSDT yang menerima (address _to, uint256 _amount)
    // 1. Buat instance IERC20 dari usdtAddress
    // 2. Panggil transfer(_to, _amount)
    // 3. Require success (hasil return transfer)
}
