import 'package:flutter/material.dart';

import '../models/game.dart';
import 'status_badge.dart';
import 'status_picker.dart';

/// List-layout item.
class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.game, required this.onStatusChange});

  final Game game;
  final ValueChanged<GameStatus> onStatusChange;

  @override
  Widget build(BuildContext context) {
    final stars = game.rating > 0 ? '★' * game.rating : 'Unrated';

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor(game.status),
          foregroundColor: Colors.white,
          child: Text(game.title[0]),
        ),
        title: Text(game.title),
        subtitle: Text(
          '${game.platform} • ${game.genre}\n'
          '${game.hoursPlayed} h • $stars',
        ),
        isThreeLine: true,
        trailing: StatusPicker(status: game.status, onSelected: onStatusChange),
      ),
    );
  }
}
