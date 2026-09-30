import 'package:flutter/material.dart';

import '../models/game.dart';

Color statusColor(GameStatus status) {
  switch (status) {
    case GameStatus.playing:
      return Colors.green;
    case GameStatus.finished:
      return Colors.blue;
    case GameStatus.dropped:
      return Colors.red;
    case GameStatus.backlog:
      return Colors.orange;
  }
}

/// Display-only coloured chip for a [GameStatus].
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    final color = statusColor(status);
    return Chip(
      label: Text(status.label),
      labelStyle: TextStyle(color: color),
      side: BorderSide(color: color),
      visualDensity: VisualDensity.compact,
    );
  }
}
