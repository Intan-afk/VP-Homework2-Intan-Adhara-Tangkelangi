import 'package:flutter/material.dart';

import '../models/game.dart';
import 'status_badge.dart';

/// A [StatusBadge] that opens a menu to pick a new status.
class StatusPicker extends StatelessWidget {
  const StatusPicker({
    super.key,
    required this.status,
    required this.onSelected,
  });

  final GameStatus status;
  final ValueChanged<GameStatus> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<GameStatus>(
      tooltip: 'Change status',
      initialValue: status,
      onSelected: onSelected,
      itemBuilder: (context) => [
        for (final option in GameStatus.values)
          PopupMenuItem<GameStatus>(value: option, child: Text(option.label)),
      ],
      child: StatusBadge(status: status),
    );
  }
}
