import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/common/primary_button.dart';
import 'package:snookerpad/ui/widgets/player/player_avatar.dart';
import 'package:snookerpad/ui/widgets/player/player_form_field.dart';

class PlayerCreate extends StatelessWidget {
  const PlayerCreate({super.key});

  static const String route = '/create';

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    Uint8List? image;
    final ImagePicker picker = ImagePicker();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        tr('add_player_title'),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final XFile? newImage = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 30,
                          preferredCameraDevice: CameraDevice.front,
                        );
                        if (newImage != null)
                          image = await newImage.readAsBytes();
                      },
                      child: Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: PlayerAvatar(
                              radius: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    PlayerFormField(
                      controller: nameController,
                      title: tr('name'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        PrimaryButton(
          onTap: () {
            BlocProvider.of<PlayersCubit>(context).addPlayer(
              Player(
                id: 0,
                name: nameController.text,
                maxbreak: 0,
                frameswon: 0,
                frameslost: 0,
                picture: image,
              ),
            );
            Routemaster.of(context).pop();
          },
          text: tr('add_player_title'),
        )
      ],
    );
  }
}
