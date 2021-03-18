import 'package:flutter/material.dart';
import 'package:stateless_stateful_widgets_demo/constants/constants.dart';

class StatelessDemoWidget extends StatelessWidget {
  final int index;
  final Color color;

  const StatelessDemoWidget({this.index, this.color});

  @override
  Widget build(BuildContext context) {
    print('Stateless #$index rebuilt.');

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      height: 150.0,
      width: 150.0,
    );
  }
}
