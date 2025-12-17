import 'package:flutter/material.dart';
import '../models/post.dart';

class BulletinBoard extends StatelessWidget {
  BulletinBoard({super.key});

  // Temporary sample posts (replace with DB later)
  final List<Post> posts = [
    Post(
      clubName: "Math Club",
      announcement: "Meeting after school on Thursday in Room 203!",
    ),
    Post(
      clubName: "Robotics Club",
      announcement: "Competition this Saturday. Mandatory meeting tomorrow!",
    ),
    Post(
      clubName: "Art Club",
      announcement: "New mural project starting next week. Sign up!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Club Bulletin Board"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: ListTile(
              title: Text(
                post.clubName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                post.announcement,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
