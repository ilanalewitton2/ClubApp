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
        backgroundColor: Colors.brown.shade800,
        title: Text(club.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(club.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 16),

          // Tabs (Home / Announcements / Contact)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Announcements"),
              Text("Contact"),
            ],
          ),

          const SizedBox(height: 24),

          // Club Heads Section
          const Text("Club Heads", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _headCircle(club.head1),
              _headCircle(club.head2),
            ],
          ),

          const SizedBox(height: 24),

          // Club Description
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
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

  Widget _headCircle(String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage("https://picsum.photos/seed/$name/200"),
        ),
        const SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}
