import 'package:flutter/material.dart';

import '../models/game.dart';

class SummaryBar extends StatelessWidget {
  const SummaryBar({super.key, required this.games, required this.shownCount});

  final List<Game> games;
  final int shownCount;

  @override
  Widget build(BuildContext context) {
    final totalHours = games.fold<int>(0, (sum, g) => sum + g.hoursPlayed);
    final backlog = games.where((g) => g.status == GameStatus.backlog).length;

    return Text(
      'Showing $shownCount of ${games.length} games • '
      '$backlog in backlog • $totalHours h played',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
