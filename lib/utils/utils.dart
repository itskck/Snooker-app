import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/utils/enums.dart';

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

String sortTypeToTitle(sortTypes type) {
  switch (type) {
    case sortTypes.won:
      return tr('sort_won');
    case sortTypes.lost:
      return tr('sort_lost');
    case sortTypes.ratio:
      return tr('sort_ratio');
    case sortTypes.maxbreak:
      return tr('sort_break');
  }
}
