import 'package:flutter/material.dart';

class PlayerStat extends StatelessWidget {
  const PlayerStat({
    super.key,
    this.icon,
    required this.title,
    required this.content,
  });

  final Icon? icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? SizedBox(),
              Text(title),
            ],
          ),
          Container(
            height: 1,
            width: 100,
            color: Colors.greenAccent,
          ),
          Text(content)
        ],
      ),
    );
  }
}
