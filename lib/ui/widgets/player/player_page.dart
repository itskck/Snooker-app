import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/player/player_info_bar.dart';
import 'package:snookerpad/ui/widgets/player/player_stats.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late bool editMode;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    editMode = false;
    controller = TextEditingController(text: widget.player.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayerInfoBar(player: widget.player),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Material(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextFormField(
                                  controller: controller,
                                  readOnly: !editMode,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: editMode ? null : InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35,
                              child: IconButton(
                                onPressed: () {
                                  if (editMode) {
                                    BlocProvider.of<PlayersCubit>(context)
                                        .editPlayer(
                                      widget.player,
                                      name: controller.text,
                                    );
                                  }

                                  setState(() {
                                    editMode = !editMode;
                                  });
                                },
                                icon: Icon(editMode ? Icons.save : Icons.edit),
                              ),
                            )
                          ],
                        ),
                      ),
                      PlayerStats(
                        player: widget.player,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(tr('clear_data')),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.33,
                        40,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(tr('delete_player')),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.33,
                        40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
