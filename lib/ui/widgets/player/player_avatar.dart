import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerAvatar extends StatefulWidget {
  const PlayerAvatar({
    super.key,
    this.radius,
    this.picture,
    required this.altText,
  });

  final double? radius;
  final Uint8List? picture;
  final Widget altText;

  @override
  State<PlayerAvatar> createState() => _PlayerAvatarState();
}

class _PlayerAvatarState extends State<PlayerAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: widget.radius,
      backgroundColor: Theme.of(context).backgroundColor,
      foregroundImage:
          widget.picture != null ? Image.memory(widget.picture!).image : null,
      child: widget.altText,
    );
  }
}
