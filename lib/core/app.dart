import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad2/bloc/theme/theme_cubit.dart';
import 'package:snookerpad2/config/routes.dart' as r;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Snooker pad',
          theme: state.theme,
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) => r.Router.onboardingCompletedRoutemap,
          ),
        );
      },
    );
  }
}
