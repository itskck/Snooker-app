import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/bloc/theme/theme_cubit.dart';
import 'package:snookerpad/ui/screens/settings/language_pick_screen.dart';
import 'package:snookerpad/ui/widgets/settings/clickable_settings_row.dart';
import 'package:snookerpad/ui/widgets/settings/mode_switch.dart';
import 'package:snookerpad/ui/widgets/settings/settings_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.onChanged});

  final void Function(Locale) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Text(
            tr('settings'),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
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
        ClickableSettingsRow(
          title: tr('pick_language'),
          onTap: () {
            print('clicked');
            Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                builder: (context) => LanguagePickScreen(onChanged: onChanged),
              ),
            );
          },
        ),
        SettingsButton(
          onTap: () => BlocProvider.of<PlayersCubit>(context).deleteAll(),
          title: tr('delete_all_players'),
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
