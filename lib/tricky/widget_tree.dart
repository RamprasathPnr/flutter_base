import 'package:flutter/material.dart';


class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WidgetA(),
      ),
    );
  }
}

class WidgetA extends StatefulWidget {
  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('buil Widget A');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter in Widget A: $_counter',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        WidgetB(
          counter: _counter,
          incrementCounter: _incrementCounter,
        ),
        SizedBox(height: 20),
        WidgetC(),
      ],
    );
  }
}

class WidgetB extends StatefulWidget {
  final int counter;
  final VoidCallback incrementCounter;

  WidgetB({required this.counter, required this.incrementCounter});

  @override
  _WidgetBState createState() => _WidgetBState();
}

class _WidgetBState extends State<WidgetB> {
  @override
  Widget build(BuildContext context) {
    print('buil Widget B');
    return Column(
      children: [
        Text(
          'Counter in Widget B: ${widget.counter}',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: widget.incrementCounter,
          child: Text('Increment Counter in A'),
        ),
      ],
    );
  }
}

class WidgetC extends StatefulWidget {
  @override
  _WidgetCState createState() => _WidgetCState();
}

class _WidgetCState extends State<WidgetC> {
  int _counterInC = 0;

  void _incrementCounterInC() {
    setState(() {
      _counterInC++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('buil Widget C');
    return Column(
      children: [
        Text(
          'Counter in Widget C: $_counterInC',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: _incrementCounterInC,
          child: Text('Increment Counter in C'),
        ),
      ],
    );
  }
}
