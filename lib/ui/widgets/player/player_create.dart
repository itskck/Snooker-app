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
import 'package:snookerpad/utils/utils.dart';

class PlayerCreate extends StatefulWidget {
  const PlayerCreate({super.key});

  static const String route = '/create';

  @override
  State<PlayerCreate> createState() => _PlayerCreateState();
}

class _PlayerCreateState extends State<PlayerCreate> {
  TextEditingController nameController = TextEditingController();
  Uint8List? image;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).viewInsets,
      child: Column(
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
                          style: Theme.of(context).textTheme.headlineSmall,
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

                          setState(() {});
                        },
                        child: Center(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: PlayerAvatar(
                                radius: 30,
                                picture: image,
                                altText: Icon(Icons.add_a_photo),
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
              if (nameController.text.isNotEmpty) {
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
              } else {
                showToast(tr('name_cannot_be_empty'));
              }
            },
            text: tr('add_player_title'),
          )
        ],
      ),
    );
  }
}
