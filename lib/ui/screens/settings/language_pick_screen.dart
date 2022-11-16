import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/ui/screens/screen_scaffold.dart';
import 'package:snookerpad/ui/widgets/settings/clickable_settings_row.dart';

class LanguagePickScreen extends StatelessWidget {
  const LanguagePickScreen({
    super.key,
    required this.onChanged,
  });

  static const String route = '/language';
  final void Function(Locale) onChanged;

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Text(
              tr('pick_language'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ClickableSettingsRow(
            title: tr('english'),
            onTap: () {
              onChanged(
                Locale('en'),
              );
              Routemaster.of(context).pop();
            },
          ),
          ClickableSettingsRow(
            title: tr('polish'),
            onTap: () {
              onChanged(
                Locale('pl'),
              );
              Routemaster.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
