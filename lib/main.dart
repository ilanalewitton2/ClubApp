import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/discovery_page.dart';

void main() {
  Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://YOUR_PROJECT_ID.supabase.co',
    anonKey: 'YOUR_ANON_PUBLIC_KEY',
  );

  runApp(const PSINTApp());
}
}

class PSINTApp extends StatelessWidget {
  const PSINTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSINT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const DiscoveryPage(),
    );
  }
}
