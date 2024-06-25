import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final Function() incrementCounter;

  CounterProvider({
    required this.counter,
    required this.incrementCounter,
    required Widget child,
  }) : super(child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return counter != oldWidget.counter;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterProvider(
        counter: 0,
        incrementCounter: () {},
        child: Scaffold(
          body: WidgetA(),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter in Widget A: ${counterProvider.counter}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        WidgetB(),
        SizedBox(height: 20),
        WidgetC(),
      ],
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context)!;

    return Column(
      children: [
        Text(
          'Counter in Widget B: ${counterProvider.counter}',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: counterProvider.incrementCounter,
          child: Text('Increment Counter in A'),
        ),
      ],
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context)!;

    return Column(
      children: [
        Text(
          'Counter in Widget C: ${counterProvider.counter}',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: counterProvider.incrementCounter,
          child: Text('Increment Counter in A'),
        ),
      ],
    );
  }
}
