import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';


class IsolatesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  int _fibonacciResult = 0;
  late ReceivePort _receivePort;

  @override
  void initState() {
    super.initState();
    _receivePort = ReceivePort();
    _receivePort.listen(_handleMessage);
  }

  @override
  void dispose() {
    _receivePort.close();
    super.dispose();
  }

  void _handleMessage(dynamic message) {
    setState(() {
      _fibonacciResult = message as int;
    });
  }

  void _calculateFibonacci() {
    Isolate.spawn(_isolateFibonacci, _receivePort.sendPort);
  }

  static void _isolateFibonacci(SendPort sendPort) {
    final int result = _fibonacci(40); // Calculate Fibonacci in the isolate
    sendPort.send(result); // Send result back to main thread
  }

  static int _fibonacci(int n) {
    if (n == 0 || n == 1) {
      return n;
    } else {
      return _fibonacci(n - 1) + _fibonacci(n - 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate Fibonacci Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _calculateFibonacci,
              child: Text('Calculate Fibonacci'),
            ),
            SizedBox(height: 20),
            Text('Fibonacci Result: $_fibonacciResult'),
          ],
        ),
      ),
    );
  }
}
