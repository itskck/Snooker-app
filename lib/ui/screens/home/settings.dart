import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/theme/theme_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (BlocProvider.of<ThemeCubit>(context).state == ThemeLight()) {
              BlocProvider.of<ThemeCubit>(context).emit(ThemeDark());
            } else {
              BlocProvider.of<ThemeCubit>(context).emit(ThemeLight());
            }
          },
          child: Text(tr('settings')),
        ),
      ],
    );
  }
}
