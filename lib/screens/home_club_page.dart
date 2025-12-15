import 'package:supabase_flutter/supabase_flutter.dart';
final supabase = Supabase.instance.client;
import 'package:flutter/material.dart';
import '../models/club.dart';

class HomeClubPage extends StatelessWidget {
  final Club club;

  const HomeClubPage({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // CLUB INFO
          Text("Category: ${club.category}", style: const TextStyle(fontSize: 18)),
          Text("Room: ${club.room}", style: const TextStyle(fontSize: 18)),
          Text("Time: ${club.time}", style: const TextStyle(fontSize: 18)),
          Text("Week: ${club.week}", style: const TextStyle(fontSize: 18)),

          const SizedBox(height: 20),

          // DESCRIPTION
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              club.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
