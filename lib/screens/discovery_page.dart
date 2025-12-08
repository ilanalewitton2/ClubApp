import 'package:flutter/material.dart';
import '../models/club.dart';
import 'home_club_page.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final clubs = [
      Club(
        name: "Club Name",
        imageUrl: "https://picsum.photos/500",
        head1: "Head #1",
        head2: "Head #2",
        room: "Room 8",
        meetingTime: "12:30–1:00 • Maroon Wednesday",
        description: "Sample club description",
      ),
      Club(
        name: "Club Name",
        imageUrl: "https://picsum.photos/501",
        head1: "Head #1",
        head2: "Head #2",
        room: "Room 3",
        meetingTime: "12:30–1:00 • Maroon Wednesday",
        description: "Sample description",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade800,
        title: const Text("DISCOVERY"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: clubs.length,
        itemBuilder: (context, i) {
          final c = clubs[i];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomeClubPage(club: c),
              ),
            ),
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Image.network(c.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(c.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text("Head #1: ${c.head1}   Head #2: ${c.head2}"),
                        Text("Room: ${c.room}"),
                        Text("Meeting Schedule: ${c.meetingTime}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
