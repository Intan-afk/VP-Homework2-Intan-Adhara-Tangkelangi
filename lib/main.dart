import 'package:flutter/material.dart';

import 'screens/backlog_screen.dart';

void main() {
  runApp(const FandomVaultApp());
}

class FandomVaultApp extends StatelessWidget {
  const FandomVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fandom Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const BacklogScreen(),
    );
  }
}
