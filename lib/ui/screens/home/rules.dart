import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lottie/lottie.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:snookerpad/bloc/language/language_cubit.dart';
import 'package:snookerpad/bloc/rules/rules_cubit.dart';
import 'package:snookerpad/core/loader.dart';
import 'package:snookerpad/ui/widgets/rules/rules_language_picker.dart';

enum RulesLocale {
  english,
  poilsh,
}

class Rules extends StatefulWidget {
  const Rules({super.key});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  void initState() {
    super.initState();
    print(
        (BlocProvider.of<LanguageCubit>(context).state as LanguageSet).locale);
    BlocProvider.of<RulesCubit>(context).initDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<RulesCubit, RulesState>(
            builder: (context, state) {
              if (state is RulesLanguageSet)
                return PDFViewer(
                  document: state.pdfDocument,
                  pickerButtonColor: Theme.of(context).scaffoldBackgroundColor,
                  lazyLoad: false,
                  progressIndicator: Loader(),
                );
              else {
                return Loader();
              }
            },
          ),
        ),
        Positioned(top: 10, left: 10, child: RulesLanguagePicker())
      ],
    );
  }
}
