/*
 * Studi Kasus: Sistem Voting Sederhana
 *
 * Tujuan:
 * - Latihan struct, array, mapping, event, dan constructor.
 *
 * Tugas:
 * 1. Struct Candidate:
 *    - string name
 *    - uint256 voteCount
 * 2. State:
 *    - Candidate[] public candidates;
 *    - mapping(address => bool) public hasVoted;
 * 3. Event:
 *    - event NewCandidate(string name);
 *    - event Voted(address indexed voter, uint256 candidateIndex);
 * 4. Constructor:
 *    - Parameter: string[] memory _candidateNames
 *    - Loop _candidateNames dan push ke candidates
 *    - Emit NewCandidate untuk setiap kandidat baru
 * 5. Function vote (public):
 *    - Parameter: uint256 _candidateIndex
 *    - Require: !hasVoted[msg.sender]
 *    - Require: _candidateIndex < candidates.length
 *    - Set hasVoted[msg.sender] = true
 *    - Tambah voteCount kandidat
 *    - Emit Voted
 * 6. Function getAllCandidates (public view):
 *    - Return: Candidate[] memory
 *    - Kembalikan seluruh array candidates
 * 7. Function getCandidatesCount (public view):
 *    - Return: uint256
 *    - Kembalikan panjang array candidates
 */
