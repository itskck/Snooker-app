import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/frames/frames_cubit.dart';
import 'package:snookerpad/ui/screens/screen_with_appbar.dart';
import 'package:snookerpad/ui/widgets/frames/frames_history_row.dart';

class FramesHistory extends StatelessWidget {
  const FramesHistory({super.key});

  static const String route = '/history';

  @override
  Widget build(BuildContext context) {
    return ScreenWithAppbar(
      title: tr('frames_history'),
      child: BlocBuilder<FramesCubit, FramesState>(
        builder: (context, state) {
          if (state is FramesData) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.frames.length,
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Divider(),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return FramesHistoryRow(
                  frame: state.frames[index],
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
