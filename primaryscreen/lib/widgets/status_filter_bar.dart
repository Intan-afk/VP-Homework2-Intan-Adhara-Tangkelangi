import 'package:flutter/material.dart';

import '../models/game.dart';

class StatusFilterBar extends StatelessWidget {
  const StatusFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final GameStatus? selected;
  final ValueChanged<GameStatus?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: selected == null,
            onSelected: (_) => onSelected(null),
          ),
          for (final status in GameStatus.values)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(status.label),
                selected: selected == status,
                onSelected: (_) => onSelected(status),
              ),
            ),
        ],
      ),
    );
  }
}
