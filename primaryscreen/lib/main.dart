import 'package:flutter/material.dart';

import 'screens/backlog_screen.dart';
import 'theme/app_theme.dart';

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
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const BacklogScreen(),
    );
  }
}