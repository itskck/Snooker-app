import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/language/language_cubit.dart';
import 'package:snookerpad/ui/screens/screen_scaffold.dart';
import 'package:snookerpad/ui/widgets/common/loader.dart';
import 'package:snookerpad/ui/widgets/settings/clickable_settings_row.dart';
import 'package:snookerpad/utils/constants.dart';

class LanguagePickScreen extends StatelessWidget {
  const LanguagePickScreen({
    super.key,
    required this.onChanged,
  });

  static const String route = '/language';
  final void Function(Locale) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        if (state is LanguageSet)
          return ScreenScaffold(
            title: tr('pick_language'),
            body: Column(
              children: [
                ClickableSettingsRow(
                  title: tr('english'),
                  active: state.locale == englishLocale,
                  onTap: () {
                    onChanged(
                      Locale('en'),
                    );
                  },
                ),
                ClickableSettingsRow(
                  title: tr('polish'),
                  active: state.locale == polishLocale,
                  onTap: () {
                    onChanged(
                      Locale('pl'),
                    );
                  },
                )
              ],
            ),
          );
        else {
          return Loader();
        }
      },
    );
  }
}
