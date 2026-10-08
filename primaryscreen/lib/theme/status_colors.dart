import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../models/game.dart';

@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({
    required this.playing,
    required this.finished,
    required this.dropped,
    required this.backlog,
  });

  final Color playing;
  final Color finished;
  final Color dropped;
  final Color backlog;

  Color colorFor(GameStatus status) {
    return switch (status) {
      GameStatus.playing => playing,
      GameStatus.finished => finished,
      GameStatus.dropped => dropped,
      GameStatus.backlog => backlog,
    };
  }

  static const StatusColors light = StatusColors(
    playing: AppColors.playingDark,
    finished: AppColors.finishedDark,
    dropped: AppColors.droppedDark,
    backlog: AppColors.backlogDark,
  );

  static const StatusColors dark = StatusColors(
    playing: AppColors.playingLight,
    finished: AppColors.finishedLight,
    dropped: AppColors.droppedLight,
    backlog: AppColors.backlogLight,
  );

  @override
  StatusColors copyWith({
    Color? playing,
    Color? finished,
    Color? dropped,
    Color? backlog,
  }) {
    return StatusColors(
      playing: playing ?? this.playing,
      finished: finished ?? this.finished,
      dropped: dropped ?? this.dropped,
      backlog: backlog ?? this.backlog,
    );
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) return this;
    return StatusColors(
      playing: Color.lerp(playing, other.playing, t)!,
      finished: Color.lerp(finished, other.finished, t)!,
      dropped: Color.lerp(dropped, other.dropped, t)!,
      backlog: Color.lerp(backlog, other.backlog, t)!,
    );
  }
}