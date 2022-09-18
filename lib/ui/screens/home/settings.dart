import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/bloc/theme/theme_cubit.dart';
import 'package:snookerpad/ui/widgets/settings/mode_switch.dart';
import 'package:snookerpad/ui/widgets/settings/settings_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return ModeSwitch(
              initialValue: state is ThemeDark,
              title: tr('enable_dark_mode'),
              onChanged: (bool) {
                BlocProvider.of<ThemeCubit>(context).emit(
                  bool ? ThemeDark() : ThemeLight(),
                );
              },
            );
          },
        ),
        SettingsButton(
          onTap: () => BlocProvider.of<PlayersCubit>(context).deleteAll(),
          title: tr('delete_all_players'),
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}
