


import 'package:flutter/material.dart';

class SingleTonExample extends StatelessWidget {
  const SingleTonExample({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {

                  print('${DataSingleTon._instance.name}');

                },
                child: Text('Click Me for Singleton class'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}


class DataSingleTon{
  //DataSingleTon._privateConstructor();
  DataSingleTon._pricateConstrctor();

  static final DataSingleTon _instance = DataSingleTon._pricateConstrctor();

  factory DataSingleTon() => _instance;

  String name ='Ramprasath K';

}