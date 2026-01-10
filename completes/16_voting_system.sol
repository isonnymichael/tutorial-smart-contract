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
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({
                name: _candidateNames[i],
                voteCount: 0
            }));
            emit NewCandidate(_candidateNames[i]);
        }
    }

    // Function untuk voting
    function vote(uint256 _candidateIndex) public {
        // 1. Validasi: Belum pernah voting
        require(!hasVoted[msg.sender], "You have already voted");
        
        // 2. Validasi: Index kandidat valid
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        // 3. Catat bahwa user ini sudah voting
        hasVoted[msg.sender] = true;

        // 4. Tambahkan suara ke kandidat
        candidates[_candidateIndex].voteCount++;
        
        // 5. Emit event
        emit Voted(msg.sender, _candidateIndex);
    }

    // Helper untuk melihat hasil voting semua kandidat
    function getAllCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }
    
    // Helper untuk melihat jumlah kandidat
    function getCandidatesCount() public view returns (uint256) {
        return candidates.length;
    }
}
