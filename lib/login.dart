import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget
{
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String _email='',_password='';
  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
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
                onChanged: (value){
                  _password=value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              ElevatedButton(onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email,
                      password: _password
                  );
                  Navigator.pushNamed(context, 'home');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}

