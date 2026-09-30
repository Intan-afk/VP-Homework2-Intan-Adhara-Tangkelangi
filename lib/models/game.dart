enum GameStatus {
  playing('Playing'),
  finished('Finished'),
  dropped('Dropped'),
  backlog('Backlog');

  const GameStatus(this.label);
  final String label;
}

class Game {
  const Game({
    required this.id,
    required this.title,
    required this.platform,
    required this.genre,
    required this.status,
    required this.hoursPlayed,
    required this.rating,
    required this.tags,
  });

  final int id;
  final String title;
  final String platform;
  final String genre;
  final GameStatus status;
  final int hoursPlayed;

  /// 0 = not rated yet, otherwise 1-5 stars.
  final int rating;
  final List<String> tags;

  Game copyWith({GameStatus? status}) {
    return Game(
      id: id,
      title: title,
      platform: platform,
      genre: genre,
      status: status ?? this.status,
      hoursPlayed: hoursPlayed,
      rating: rating,
      tags: tags,
    );
  }
}

const List<Game> sampleGames = [
  Game(
    id: 1,
    title: 'Elden Ring',
    platform: 'PC',
    genre: 'Action RPG',
    status: GameStatus.playing,
    hoursPlayed: 86,
    rating: 5,
    tags: ['Souls-like', 'Open World'],
  ),
  Game(
    id: 2,
    title: 'Hades',
    platform: 'Nintendo Switch',
    genre: 'Roguelike',
    status: GameStatus.finished,
    hoursPlayed: 48,
    rating: 5,
    tags: ['Roguelike', 'Mythology'],
  ),
  Game(
    id: 3,
    title: 'Hollow Knight',
    platform: 'PC',
    genre: 'Metroidvania',
    status: GameStatus.backlog,
    hoursPlayed: 0,
    rating: 0,
    tags: ['Metroidvania', 'Souls-like'],
  ),
  Game(
    id: 4,
    title: 'Cyberpunk 2077',
    platform: 'PS5',
    genre: 'Open World RPG',
    status: GameStatus.dropped,
    hoursPlayed: 12,
    rating: 3,
    tags: ['Open World', 'Sci-Fi'],
  ),
  Game(
    id: 5,
    title: 'Persona 5 Royal',
    platform: 'PS5',
    genre: 'JRPG',
    status: GameStatus.playing,
    hoursPlayed: 64,
    rating: 5,
    tags: ['JRPG', 'Story Rich'],
  ),
  Game(
    id: 6,
    title: 'Celeste',
    platform: 'PC',
    genre: 'Platformer',
    status: GameStatus.finished,
    hoursPlayed: 14,
    rating: 4,
    tags: ['Platformer', 'Story Rich'],
  ),
  Game(
    id: 7,
    title: "Baldur's Gate 3",
    platform: 'PC',
    genre: 'CRPG',
    status: GameStatus.backlog,
    hoursPlayed: 0,
    rating: 0,
    tags: ['CRPG', 'Story Rich'],
  ),
  Game(
    id: 8,
    title: 'Stardew Valley',
    platform: 'Mobile',
    genre: 'Simulation',
    status: GameStatus.dropped,
    hoursPlayed: 9,
    rating: 3,
    tags: ['Cozy', 'Farming'],
  ),
  Game(
    id: 9,
    title: 'Genshin Impact',
    platform: 'Mobile',
    genre: 'Action RPG',
    status: GameStatus.playing,
    hoursPlayed: 320,
    rating: 4,
    tags: ['Open World', 'Gacha'],
  ),
  Game(
    id: 10,
    title: 'The Witcher 3',
    platform: 'PC',
    genre: 'Action RPG',
    status: GameStatus.finished,
    hoursPlayed: 110,
    rating: 5,
    tags: ['Open World', 'Story Rich'],
  ),
  Game(
    id: 11,
    title: 'Hi-Fi Rush',
    platform: 'PC',
    genre: 'Rhythm Action',
    status: GameStatus.backlog,
    hoursPlayed: 0,
    rating: 0,
    tags: ['Rhythm', 'Cozy'],
  ),
  Game(
    id: 12,
    title: 'Slay the Spire',
    platform: 'PC',
    genre: 'Deckbuilder',
    status: GameStatus.playing,
    hoursPlayed: 35,
    rating: 4,
    tags: ['Roguelike', 'Deckbuilder'],
  ),
];
