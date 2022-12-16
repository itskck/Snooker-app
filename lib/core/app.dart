import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/language/language_cubit.dart';
import 'package:snookerpad/bloc/theme/theme_cubit.dart';
import 'package:snookerpad/config/routes.dart' as r;
import 'package:snookerpad/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('pl'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: BlocProvider.of<LanguageCubit>(context).state is LanguageSet
          ? (BlocProvider.of<LanguageCubit>(context).state as LanguageSet)
              .locale
          : englishLocale,
      path: 'assets/translations',
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
