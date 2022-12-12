import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:snookerpad/bloc/rules/rules_cubit.dart';
import 'package:snookerpad/utils/constants.dart';

class RulesLanguagePicker extends StatefulWidget {
  const RulesLanguagePicker({super.key});

  @override
  State<RulesLanguagePicker> createState() => _RulesLanguagePickerState();
}

class _RulesLanguagePickerState extends State<RulesLanguagePicker> {
  final List<Locale> supportedLocales = [englishLocale, polishLocale];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RulesCubit, RulesState>(
      builder: (context, state) {
        if (state is RulesLanguageSet)
          return ToggleButtons(
            children: [
              Text('en'),
              Text('pl'),
            ],
            isSelected: [
              state.currentLocale == englishLocale,
              state.currentLocale == polishLocale,
            ],
            onPressed: (int index) {
              BlocProvider.of<RulesCubit>(context).switchRulesLocale();
            },
          );
        else
          return SizedBox();
      },
    );
  }
}
