


import 'package:flutter/material.dart';

class ThenVsAwait extends StatefulWidget {
  const ThenVsAwait({super.key});

  @override
  State<ThenVsAwait> createState() => _ThenVsAwaitState();
}

class _ThenVsAwaitState extends State<ThenVsAwait> {

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
                  print(await getString('ram'));
                  print('Process Completion');

                },
                child: Text('Click Me await'),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () async {

                  getString('ram').then((value) => print(value));
                  print('execution completion');

                },
                child: Text('Click Me Then'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

Future<String> getString(String str) async{

  await Future.delayed(const Duration(seconds: 10));
  return str;

}