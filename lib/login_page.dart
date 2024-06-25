



import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  TextEditingController textEdtUserName = TextEditingController();
  TextEditingController textEdtPassword = TextEditingController();

  String name  ='Ramprasath';
  String password ='Welcome@123';

    @override
  Widget build(BuildContext context){
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Login Page'),),
          body: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'User Name'
                  ),
                  controller: textEdtUserName,
                ),
                SizedBox(height: 40,),
                TextField(
                  controller: textEdtPassword,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){


                  if(textEdtUserName.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User is empty')));
                  }else if(textEdtPassword.text.isEmpty){
                    print('password is empty');
                  }else{

                    if(textEdtUserName.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter user name')));
                    }else if(textEdtPassword.text.isEmpty){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter password')));
                    }else if(textEdtUserName.text == name  && textEdtPassword.text == password){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect password')));
                    }
                  }
                  print(textEdtUserName.text);
                  print(textEdtPassword.text);

          
                }, child: Text('Login btn'))
              ],
            ),
          ),
        ),
      );
}

}