import 'package:flutter/material.dart';
import 'package:stateless_stateful_widgets_demo/screens/stateless_demo_widget.dart';

class StatefulDemoScreen extends StatefulWidget {
  final List<Color> colors = [
    Colors.blue,
    Colors.lime,
  ];

  @override
  _StatefulDemoScreenState createState() => _StatefulDemoScreenState();
}

class _StatefulDemoScreenState extends State<StatefulDemoScreen> {
  int selectedColor = 0;

  onTap() {
    print('setState() called');
    setState(() {
      selectedColor = selectedColor == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Stateful rebuilt. selectedColor: $selectedColor');

    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stateless/Stateful Widget Demo'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Tap anywhere on the screen',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),

                StatelessDemoWidget(
                  index: 0,
                  color: widget.colors[selectedColor],
                ),

                // TODO (1): Notice how this stateless widget is also being rebuilt.
                // A setState() call rebuilds all its children, not just the ones that depend on the new data.
                StatelessDemoWidget(
                  index: 1,
                  color: Colors.red,
                ),

                // TODO (2): Notice how this widget is not being rebuilt on setState calls.
                // To avoid certain widgets being rebuilt, use a const constructor
                const StatelessDemoWidget(
                  index: 2,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
