import 'package:firebase/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/signup.dart';
import 'main.dart';

class login extends StatefulWidget{
  const login({super.key});
  @override
  State<login> createState()=> _loginState();
}

class _loginState extends State<login>{
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "password",
                ),

                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email, password: _password)
                      .then((user){
                    Navigator.of(context).pushReplacementNamed('myhome');

                  }
                  )
                      .catchError((e){
                    print(e);
                  });
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const signuppage())),
                child: Text("signup")),
          ],
        ),
      ),
    );
  }
}