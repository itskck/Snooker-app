import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
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

void showToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
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

int getPlayerByName(String name, BuildContext context) {
  return BlocProvider.of<PlayersCubit>(context)
      .players
      .singleWhere((element) => element.name == name)
      .id;
}

Player? getPlayerById(int playerId, BuildContext context) {
  return BlocProvider.of<PlayersCubit>(context).players.singleWhere(
        (element) => element.id == playerId,
      );
}
