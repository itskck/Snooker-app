import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeaderboardTitle extends StatelessWidget {
  const LeaderboardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            tr('player'),
            style: style,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            tr('frames_won'),
            style: style,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            tr('frames_lost'),
            style: style,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            tr('win_ratio'),
            style: style,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            tr('max_break'),
            style: style,
          ),
        ),
        Expanded(child: SizedBox())
      ],
    );
  }
}
