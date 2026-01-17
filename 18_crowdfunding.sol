/*
 * Studi Kasus: Penggalangan Dana (Donasi) - Crowdfunding
 *
 * Tujuan:
 * - Latihan payable, modifier, event, dan pola keamanan dasar.
 *
 * Tugas:
 * 1. State:
 *    - address public owner;
 *    - uint256 public targetAmount;
 *    - uint256 public deadline;
 *    - uint256 public raisedAmount;
 *    - uint256 public minDonation;
 *    - mapping(address => uint256) public donations;
 * 2. Event:
 *    - event Donated(address indexed donor, uint256 amount);
 *    - event Withdrawn(uint256 amount);
 * 3. Constructor:
 *    - Parameter: uint256 _targetAmount, uint256 _durationInMinutes
 *    - Set owner = msg.sender
 *    - Set targetAmount
 *    - Set deadline = block.timestamp + (_durationInMinutes * 1 minutes)
 *    - Set minDonation (misal 0.0001 ether)
 * 4. Modifier onlyOwner:
 *    - Require msg.sender == owner
 *    - Underscore di akhir untuk melanjutkan eksekusi
 * 5. Modifier campaignOpen:
 *    - Require block.timestamp < deadline
 * 6. Modifier campaignFinished:
 *    - Require block.timestamp >= deadline
 * 7. Function donate (public payable, campaignOpen):
 *    - Require msg.value >= minDonation
 *    - Tambah donations[msg.sender]
 *    - Tambah raisedAmount
 *    - Emit Donated
 * 8. Function withdraw (public, onlyOwner):
 *    - Require raisedAmount >= targetAmount
 *    - Require address(this).balance > 0
 *    - Transfer seluruh balance ke owner (gunakan call)
 *    - Emit Withdrawn
 * 9. Function refund (public, campaignFinished):
 *    - Require raisedAmount < targetAmount
 *    - Ambil donasi user dari donations[msg.sender]
 *    - Require donasi > 0
 *    - Set donations[msg.sender] = 0 (check-effects-interactions)
 *    - Refund ke user (gunakan call)
 * 10. Function timeLeft (public view):
 *    - Jika block.timestamp >= deadline, return 0
 *    - Jika belum, return deadline - block.timestamp
 */
