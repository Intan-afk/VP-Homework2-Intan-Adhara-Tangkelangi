import 'package:flutter/material.dart';

class TagFilterBar extends StatelessWidget {
  const TagFilterBar({
    super.key,
    required this.tags,
    required this.selected,
    required this.onSelected,
  });

  final List<String> tags;
  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final tag in tags)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text('#$tag'),
                selected: selected == tag,
                onSelected: (isSelected) => onSelected(isSelected ? tag : null),
              ),
            ),
        ],
      ),
    );
  }
}
