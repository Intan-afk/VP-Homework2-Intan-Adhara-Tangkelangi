import 'package:flutter/material.dart';

import '../models/game.dart';
import 'status_picker.dart';

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
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final stars = game.rating > 0 ? '★' * game.rating : 'Unrated';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: scheme.secondaryContainer,
              foregroundColor: scheme.onSecondaryContainer,
              child: Text(game.title[0]),
            ),
            Text(
              game.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                color: scheme.onSurface,
              ),
            ),
            Text(
              '${game.platform} • ${game.hoursPlayed} h\n$stars',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            StatusPicker(status: game.status, onSelected: onStatusChange),
          ],
        ),
      ),
    );
  }
}