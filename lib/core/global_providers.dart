import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad2/bloc/theme/theme_cubit.dart';
import 'package:snookerpad2/bloc/user/user_cubit.dart';
import 'package:snookerpad2/core/app.dart';

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
      ],
      child: const App(),
    );
  }
}
