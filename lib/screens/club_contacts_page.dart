import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ClubContactsPage extends StatefulWidget {
  final String clubId;

  const ClubContactsPage({super.key, required this.clubId});

  @override
  State<ClubContactsPage> createState() => _ClubContactsPageState();
}

class _ClubContactsPageState extends State<ClubContactsPage> {
  Map<String, dynamic>? club;
  Map<String, dynamic>? advisors;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    final clubData = await supabase
        .from('clubs')
        .select(
          'head_name1, head_email1, head_name2, head_email2, '
          'head_name3, head_email3, head_name4, head_email4',
        )
        .eq('id', widget.clubId)
        .single();

    final advisorData = await supabase
        .from('advisors')
        .select(
          'advisor_name1, advisor_email1, '
          'advisor_name2, advisor_email2, '
        )
        .eq('club_id', widget.clubId)
        .single();

    setState(() {
      club = clubData;
      advisors = advisorData;
      loading = false;
    });
  }

  Widget contactTile(String name, String email, {String? role}) {
    return ListTile(
      title: Text(name),
      subtitle: Text(email),
      trailing: role != null ? Text(role) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Club Heads",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          ...List.generate(4, (i) {
            final name = club!['head_name${i + 1}'];
            final email = club!['head_email${i + 1}'];

            if (name == null || email == null) return const SizedBox.shrink();
            return contactTile(name, email, role: "Head");
          }),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Advisors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          ...List.generate(2, (i) {
            final name = advisors?['advisor_name${i + 1}'];
            final email = advisors?['advisor_email${i + 1}'];

            if (name == null || email == null) return const SizedBox.shrink();
            return contactTile(name, email, role: "Advisor");
          }),
        ],
      ),
    );
  }
}
