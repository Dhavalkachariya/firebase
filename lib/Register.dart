import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget
{
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    String _email='',_password='';
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value){
                  _email=value;
                },
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
              ),
              TextField(
                obscureText: true,
                onChanged: (value){
                  _password=value;
                },
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              ElevatedButton(onPressed: () async{
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                  Navigator.pushNamed(context, 'login');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
                  child: Text('Register')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

