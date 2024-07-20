import 'package:flutter/material.dart';

class PlayerChooser extends StatefulWidget {
  const PlayerChooser(
      {super.key, required this.names, required this.onChanged});

  final List<String> names;
  final void Function(String? value) onChanged;

  @override
  State<PlayerChooser> createState() => _PlayerChooserState();
}

class _PlayerChooserState extends State<PlayerChooser> {
  late String? state;

  @override
  void initState() {
    super.initState();
    state = widget.names[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: DropdownButton<String>(
        value: state,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        items: widget.names
            .map((name) => DropdownMenuItem(
                  child: Text(name),
                  value: name,
                ))
            .toList(),
        onChanged: (newValue) {
          widget.onChanged(newValue);
          setState(() {
            state = newValue;
          });
        },
      ),
    );
  }
}
