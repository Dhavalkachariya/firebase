import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homepage.dart';




class mylogin extends StatefulWidget{
  const mylogin({super.key});

  State<mylogin> createState() => _myloginState();
}


class _myloginState extends State<mylogin>{


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('sign up'),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent,
                    Colors.blueAccent
                  ]
              )
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'enter email',
                  icon: Icon(Icons.email),

                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                  icon: Icon(Icons.password),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: (){
                  _auth.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                      .then((signinuser) {
                       setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => myhome()));

                       });
                  }).catchError((e){
                    print(e);
                  });
                },
                child: Text('Login'),
                color: Colors.amber,
                shape: ShapeBorder.lerp(RoundedRectangleBorder(), CircleBorder(), 5.0),

              )
            ],
          ),
        ),
      ),
    );
  }
}