import 'package:flutter/material.dart';


class GlobalKeysExample extends StatelessWidget {
  // Create a global key to access the state of FirstWidget
  static GlobalKey<_FirstWidgetState> firstWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FirstWidget(key: firstWidgetKey), // Pass the global key to FirstWidget
              SizedBox(height: 20),
              SecondWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstWidget extends StatefulWidget {
  FirstWidget({Key? key}) : super(key: key);

  @override
  _FirstWidgetState createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: 'Enter text',
        ),
      ),
    );
  }

  String getText() {
    return _textEditingController.text;
  }
}

class SecondWidget extends StatefulWidget {
  @override
  _SecondWidgetState createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Access the global key to get the state of FirstWidget
        String text = GlobalKeysExample.firstWidgetKey.currentState!.getText();
        print('Text from FirstWidget: $text');
      },
      child: Text('Get Text from FirstWidget'),
    );
  }
}
