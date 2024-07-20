import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/utils/enums.dart';
import 'package:snookerpad/utils/utils.dart';

class SortChips extends StatefulWidget {
  const SortChips({super.key});

  @override
  State<SortChips> createState() => _SortChipsState();
}

class _SortChipsState extends State<SortChips> {
  int? value = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlayersCubit>(context)
        .changeSortType(sortType: sortTypes.values[value!]);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          spacing: 5,
          children: List<ChoiceChip>.generate(
            sortTypes.values.length,
            (index) => ChoiceChip(
              label: Text(
                sortTypeToTitle(sortTypes.values[index]),
              ),
              selected: value == index,
              onSelected: (selected) {
                setState(() {
                  value = selected ? index : value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
