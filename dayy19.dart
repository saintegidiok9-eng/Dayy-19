enum VoteChoice 
{
  candidateA,
  candidateB,
  candidateC
}

class Voter 
{
  final String id;
  bool _hasVoted = false;

  Voter(this.id);

  bool get hasVoted => _hasVoted;

  void markVoted() 
  {
    _hasVoted = true;
  }
}

class Election 
{
  final Map<VoteChoice, int> _results = 
  {
    VoteChoice.candidateA: 0,
    VoteChoice.candidateB: 0,
    VoteChoice.candidateC: 0,
  };

  void castVote(Voter voter, VoteChoice choice) 
  {
    if (voter.hasVoted) 
    {
      print("Voter ${voter.id} has already voted.");
      return;
    }

    _results[choice] = _results[choice]! + 1;
    voter.markVoted();
    print("Vote recorded for ${choice.name}");
  }

  void printResults() 
  {
    for (var entry in _results.entries) 
    {
      print("${entry.key.name}: ${entry.value} votes");
    }
  }
}

void main() 
{
  Voter v1 = Voter("V001");
  Voter v2 = Voter("V002");

  Election election = Election();

  election.castVote(v1, VoteChoice.candidateA);
  election.castVote(v1, VoteChoice.candidateB);
  election.castVote(v2, VoteChoice.candidateC);

  election.printResults();
}
