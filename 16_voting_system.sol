// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract VotingSystem {
    // Studi Kasus: Sistem Voting Sederhana
    
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Array semua kandidat
    Candidate[] public candidates;
    
    // Mapping untuk menyimpan status apakah address sudah memilih
    mapping(address => bool) public hasVoted;
    
    // Event
    event NewCandidate(string name);
    event Voted(address indexed voter, uint256 candidateIndex);

    // Constructor untuk inisialisasi kandidat awal
    constructor(string[] memory _candidateNames) {
        // TODO: Loop _candidateNames dan push ke array candidates
        
        // TODO: Emit event NewCandidate
        
    }

    // Function untuk voting
    // TODO: Buat function public bernama vote yang menerima parameter uint256 _candidateIndex
    // 1. Validasi: Belum pernah voting (gunakan require !hasVoted[msg.sender])
    // 2. Validasi: Index kandidat valid (gunakan require _candidateIndex < candidates.length)
    // 3. Catat bahwa user ini sudah voting (set hasVoted[msg.sender] = true)
    // 4. Tambahkan suara ke kandidat (increment voteCount)
    // 5. Emit event Voted

    // Helper untuk melihat hasil voting semua kandidat
    // TODO: Buat function public view bernama getAllCandidates yang mengembalikan array Candidate[]
    // Function ini mengembalikan seluruh array candidates
    
    // Helper untuk melihat jumlah kandidat
    function getCandidatesCount() public view returns (uint256) {
        // TODO: Kembalikan panjang array candidates
        
    }
}
