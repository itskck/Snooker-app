import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/frames/frames_cubit.dart';
import 'package:snookerpad/bloc/language/language_cubit.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/bloc/rules/rules_cubit.dart';
import 'package:snookerpad/bloc/theme/theme_cubit.dart';
import 'package:snookerpad/bloc/user/user_cubit.dart';
import 'package:snookerpad/core/app.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => FramesCubit(),
        ),
        BlocProvider<PlayersCubit>(
          create: (context) => PlayersCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<RulesCubit>(
          create: (context) => RulesCubit.create(context),
        )
      ],
      child: const App(),
    );
  }
}
