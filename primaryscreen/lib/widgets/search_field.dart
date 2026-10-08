import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search title or genre...',
      leading: const Icon(Icons.search),
      onChanged: onChanged,
    );
  }
}