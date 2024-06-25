


import 'package:flutter/material.dart';

class AsyncVsAsyncStar extends StatefulWidget {
  const AsyncVsAsyncStar({super.key});

  @override
  State<AsyncVsAsyncStar> createState() => _AsyncVsAsyncStarState();
}

class _AsyncVsAsyncStarState extends State<AsyncVsAsyncStar> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  print(await doSomeLongTask());
                },
                child: Text('Click Me async'),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () async {
                 generateNumbers().listen((int value) {
                   print(value); // Print each value emitted by the stream
                 });
                },
                child: Text('Click Me async*'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

Future<int> doSomeLongTask() async {
await Future.delayed(const Duration(seconds: 3));
return 42;
}


Stream<int> generateNumbers() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}


