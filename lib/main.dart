import 'package:flutter/material.dart';
import 'screens/discovery_page.dart';

void main() {
  runApp(const PSINTApp());
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
