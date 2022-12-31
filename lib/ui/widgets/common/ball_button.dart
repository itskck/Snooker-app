import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/frame/frame_cubit.dart';

enum BallButtonType { red, yellow, green, brown, blue, pink, black }

class BallButton extends StatelessWidget {
  const BallButton({
    super.key,
    required this.ballButtonType,
    required this.playerId,
  });

  final BallButtonType ballButtonType;
  final int playerId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        _mapTypeToAsset(ballButtonType),
        height: 50,
        width: 50,
      ),
      onPressed: () => BlocProvider.of<FrameCubit>(context).addPoints(
        points: _mapTypeToPoints(ballButtonType),
        playerId: playerId,
      ),
    );
  }

  String _mapTypeToAsset(BallButtonType ballButtonType) {
    switch (ballButtonType) {
      case BallButtonType.red:
        return 'assets/images/red.png';
      case BallButtonType.yellow:
        return 'assets/images/yellow.png';
      case BallButtonType.green:
        return 'assets/images/green.png';
      case BallButtonType.brown:
        return 'assets/images/brown.png';
      case BallButtonType.blue:
        return 'assets/images/blue.png';
      case BallButtonType.pink:
        return 'assets/images/pink.png';
      case BallButtonType.black:
        return 'assets/images/black.png';
    }
  }

  int _mapTypeToPoints(BallButtonType ballButtonType) {
    switch (ballButtonType) {
      case BallButtonType.red:
        return 1;
      case BallButtonType.yellow:
        return 2;
      case BallButtonType.green:
        return 3;
      case BallButtonType.brown:
        return 4;
      case BallButtonType.blue:
        return 5;
      case BallButtonType.pink:
        return 6;
      case BallButtonType.black:
        return 7;
    }
  }
}
