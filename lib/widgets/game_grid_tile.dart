import 'package:flutter/material.dart';

import '../models/game.dart';
import 'status_badge.dart';
import 'status_picker.dart';

/// Grid-layout item.
class GameGridTile extends StatelessWidget {
  const GameGridTile({
    super.key,
    required this.game,
    required this.onStatusChange,
  });

  final Game game;
  final ValueChanged<GameStatus> onStatusChange;

  @override
  Widget build(BuildContext context) {
    final stars = game.rating > 0 ? '★' * game.rating : 'Unrated';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: statusColor(game.status),
              foregroundColor: Colors.white,
              child: Text(game.title[0]),
            ),
            Text(
              game.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '${game.platform} • ${game.hoursPlayed} h\n$stars',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            StatusPicker(status: game.status, onSelected: onStatusChange),
          ],
        ),
      ),
    );
  }
}
