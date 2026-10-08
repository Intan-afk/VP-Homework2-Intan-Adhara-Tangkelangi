import 'package:flutter/material.dart';

import '../models/game.dart';
import '../theme/status_colors.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<StatusColors>()!.colorFor(status);

    return Chip(
      avatar: Icon(Icons.circle, size: 12, color: color),
      label: Text(status.label),
      visualDensity: VisualDensity.compact,
    );
  }
}