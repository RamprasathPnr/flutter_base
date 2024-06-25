


import 'package:flutter/material.dart';

class ThenVsWhenComplete extends StatefulWidget {
  const ThenVsWhenComplete({super.key});

  @override
  State<ThenVsWhenComplete> createState() => _ThenVsAwaitState();
}

class _ThenVsAwaitState extends State<ThenVsWhenComplete> {


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Then vs When Complete'),),
      body: Container(
        child: ElevatedButton(onPressed: (){
          getString('ram').then((value) {
            print('Future finished successfully i.e. without error');
          }).catchError((error) {
            print('Future finished with error');
          }).whenComplete(() {
            print('Either of then or catchError has run at this point');
          });
        },child:Text('Then vs When Complete') ,),
      ),
    );
  }
}


Future<String> getString(String str) async{

  Future.delayed(const Duration(seconds: 5));
  return str;
  
}
