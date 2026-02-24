
class LeaderboardEntry {
  final int rank;
  final String name;
  final int score;

  LeaderboardEntry({required this.rank, required this.name, required this.score});

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(
      rank: json['rank'],
      name: json['player']['publicName'],
      score: json['score'],
    );
  }
}
