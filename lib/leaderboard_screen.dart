
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:js/js_util.dart';
import 'alert_service.dart';
import 'leaderboard_entry.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  Future<List<LeaderboardEntry>>? _leaderboardFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = _fetchLeaderboard();
  }

  Future<List<LeaderboardEntry>> _fetchLeaderboard() async {
    final result = await promiseToFuture(getLeaderboard());
    if (result != null) {
      final leaderboardData = jsonDecode(result.toDart as String) as List<dynamic>;
      return leaderboardData
          .map((entry) => LeaderboardEntry.fromJson(entry))
          .toList();
    } else {
      // Handle the case where the leaderboard data is null
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: FutureBuilder<List<LeaderboardEntry>>(
        future: _leaderboardFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No leaderboard data available.'));
          } else {
            final entries = snapshot.data!;
            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return ListTile(
                  leading: Text(entry.rank.toString()),
                  title: Text(entry.name),
                  trailing: Text(entry.score.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
