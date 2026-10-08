import 'package:flutter/material.dart';
import 'package:primaryscreen/widgets/game_card.dart';

import '../models/game.dart';
import '../widgets/search_field.dart';
import '../widgets/status_filter_bar.dart';

/// Primary screen
/// query, status filter, tag filter, grid/list mode, and the games.
class BacklogScreen extends StatefulWidget {
  const BacklogScreen({super.key});

  @override
  State<BacklogScreen> createState() => _BacklogScreenState();
}

class _BacklogScreenState extends State<BacklogScreen> {
  String _query = '';
  GameStatus? _selectedStatus;
  String? _selectedTag;
  final List<Game> _games = List.of(sampleGames);

  List<Game> get _filteredGames {
    final query = _query.toLowerCase();
    return _games.where((game) {
      final matchesQuery =
          game.title.toLowerCase().contains(query) ||
          game.genre.toLowerCase().contains(query);
      final matchesStatus =
          _selectedStatus == null || game.status == _selectedStatus;
      final matchesTag =
          _selectedTag == null || game.tags.contains(_selectedTag);
      return matchesQuery && matchesStatus && matchesTag;
    }).toList();
  }

  void _onQueryChanged(String value) => setState(() => _query = value);

  void _onStatusSelected(GameStatus? status) =>
      setState(() => _selectedStatus = status);

  void _onGameStatusChanged(Game game, GameStatus newStatus) {
    setState(() {
      final index = _games.indexWhere((g) => g.id == game.id);
      if (index != -1) {
        _games[index] = game.copyWith(status: newStatus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game Backlog')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: SearchField(onChanged: _onQueryChanged)),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 12),
            StatusFilterBar(
              selected: _selectedStatus,
              onSelected: _onStatusSelected,
            ),
            const SizedBox(height: 8),

            const SizedBox(height: 12),
            Expanded(
              child: _filteredGames.isEmpty
                  ? const Center(
                      child: Text('No games match your search or filters.'),
                    )
                  : ListView.builder(
                      itemCount: _filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = _filteredGames[index];
                        return GameCard(
                          game: game,
                          onStatusChange: (newStatus) =>
                              _onGameStatusChanged(game, newStatus),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
