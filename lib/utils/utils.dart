import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';

Future<void> showDialogWindow(BuildContext context, Widget content) {
  return showDialog(
    context: context,
    builder: (context) => content,
  );
}

int getMaxId(List<Player> players) {
  if (players.isEmpty) return 0;
  final List<Player> sortedById = players;
  sortedById.sort((a, b) => a.id.compareTo(b.id));
  return sortedById.last.id;
}
