import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/ui/screens/screen_scaffold.dart';
import 'package:snookerpad/ui/widgets/common/primary_button.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NewFrame extends StatelessWidget {
  const NewFrame({super.key});
  static const String route = '/new-frame';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(
      builder: (context, state) {
        if (state is PlayersWithData) {
          List<String> names = [];
          state.players.forEach((element) => names.add(element.name));

          return ScreenScaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Text(
                    tr('choose_players'),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: WheelChooser(
                        horizontal: true,
                        isInfinite: true,
                        itemSize: 100,
                        selectTextStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        unSelectTextStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        startPosition: names.length ~/ 2,
                        onValueChanged: (value) {},
                        datas: names,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Icon(Icons.keyboard_arrow_up),
                    ),
                    Text('vs'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: WheelChooser(
                        horizontal: true,
                        itemSize: 100,
                        selectTextStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        unSelectTextStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        isInfinite: true,
                        startPosition: names.length ~/ 2,
                        onValueChanged: (value) {},
                        datas: names,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(tr('play')),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.33,
                            40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(tr('cancel')),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.33,
                            40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
