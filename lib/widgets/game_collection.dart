import 'package:flutter/material.dart';

import '../models/game.dart';
import 'empty_state.dart';
import 'game_card.dart';
import 'game_grid_tile.dart';

/// Chooses between empty state, list layout and grid layout.
class GameCollection extends StatelessWidget {
  const GameCollection({
    super.key,
    required this.games,
    required this.isGrid,
    required this.onStatusChange,
  });

  final List<Game> games;
  final bool isGrid;
  final void Function(Game game, GameStatus status) onStatusChange;

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const EmptyState();
    }

    if (isGrid) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return GameGridTile(
            key: ValueKey(game.id),
            game: game,
            onStatusChange: (status) => onStatusChange(game, status),
          );
        },
      );
    }

    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GameCard(
          key: ValueKey(game.id),
          game: game,
          onStatusChange: (status) => onStatusChange(game, status),
        );
      },
    );
  }
}
