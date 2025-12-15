import 'package:supabase_flutter/supabase_flutter.dart';
final supabase = Supabase.instance.client;
import 'package:flutter/material.dart';
import '../models/club.dart';
import 'home_club_page.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List<Club> clubs = [];
  String sortMethod = "Alphabetical";

  @override
  void initState() {
    super.initState();
    fetchClubs();
  }

  Future<void> fetchClubs() async {
    final response = await Supabase.instance.client
        .from('clubs')
        .select();

    setState(() {
      clubs = response.map<Club>((c) => Club.fromJson(c)).toList();
      applySorting();
    });
  }

  void applySorting() {
    setState(() {
      if (sortMethod == "Alphabetical") {
        clubs.sort((a, b) => a.name.compareTo(b.name));
      } else if (sortMethod == "Category") {
        clubs.sort((a, b) => a.category.compareTo(b.category));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DISCOVERY"),
      ),

      body: Column(
        children: [
          // SORTING DROPDOWN
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Text("Sort by: ", style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  value: sortMethod,
                  items: const [
                    DropdownMenuItem(value: "Alphabetical", child: Text("Alphabetical")),
                    DropdownMenuItem(value: "Category", child: Text("Category")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sortMethod = value!;
                      applySorting();
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
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
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),

                          Text("Category: ${c.category}"),
                          Text("Room: ${c.room}"),
                          Text("Time: ${c.time}"),
                          Text("Week: ${c.week}"),

                          const SizedBox(height: 10),
                          Text(
                            c.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
