import 'package:flutter/material.dart';
import 'login.dart';

class first extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'login');
            }, child: Text('Login'),

            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'register');
            }, child: Text('Register')
            )
          ],
        ),
      ),
    );
  }
}

