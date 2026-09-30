import 'package:flutter/material.dart';

import '../models/game.dart';
import '../widgets/game_collection.dart';
import '../widgets/search_field.dart';
import '../widgets/status_filter_bar.dart';
import '../widgets/summary_bar.dart';
import '../widgets/tag_filter_bar.dart';
import '../widgets/view_toggle.dart';

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
  bool _isGrid = false;
  final List<Game> _games = List.of(sampleGames);

  List<String> get _allTags {
    final tags = {for (final game in _games) ...game.tags}.toList();
    tags.sort();
    return tags;
  }

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

  void _onTagSelected(String? tag) => setState(() => _selectedTag = tag);

  void _onViewChanged(bool isGrid) => setState(() => _isGrid = isGrid);

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
                ViewToggle(isGrid: _isGrid, onChanged: _onViewChanged),
              ],
            ),
            const SizedBox(height: 12),
            StatusFilterBar(
              selected: _selectedStatus,
              onSelected: _onStatusSelected,
            ),
            const SizedBox(height: 8),
            TagFilterBar(
              tags: _allTags,
              selected: _selectedTag,
              onSelected: _onTagSelected,
            ),
            const SizedBox(height: 12),
            SummaryBar(games: _games, shownCount: _filteredGames.length),
            const SizedBox(height: 8),
            Expanded(
              child: GameCollection(
                games: _filteredGames,
                isGrid: _isGrid,
                onStatusChange: _onGameStatusChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
