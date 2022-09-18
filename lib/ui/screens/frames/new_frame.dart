import 'package:flutter/material.dart';
import 'package:snookerpad/ui/screens/screen_scaffold.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NewFrame extends StatelessWidget {
  const NewFrame({super.key});
  static const String route = '/new-frame';

  @override
  Widget build(BuildContext context) {
    const mockData = [
      'test1',
      'test2',
      'test3',
      'test4',
      'test5',
    ];
    return ScreenScaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: WheelChooser(
                  isInfinite: true,
                  onValueChanged: (value) {},
                  datas: mockData,
                ),
              ),
              Icon(Icons.keyboard_arrow_left),
              Icon(Icons.keyboard_arrow_right),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: WheelChooser(
                  isInfinite: true,
                  startPosition: mockData.length ~/ 2,
                  onValueChanged: (value) {},
                  datas: mockData,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
