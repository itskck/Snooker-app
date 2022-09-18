import 'package:flutter/material.dart';

class ModeSwitch extends StatefulWidget {
  ModeSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    required this.title,
  });

  final bool initialValue;
  final void Function(bool) onChanged;
  final String title;

  @override
  State<ModeSwitch> createState() => _ModeSwitchState();
}

class _ModeSwitchState extends State<ModeSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Switch(
        onChanged: (state) {
          setState(() {
            value = state;
          });
          widget.onChanged(state);
        },
        value: value,
      ),
    );
  }
}
