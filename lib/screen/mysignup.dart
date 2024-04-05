import 'package:firebase/screen/mylogin.dart';
import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../google/firebaseservice.dart';
import 'googlesignin.dart';
import 'homepage.dart';




class mysignup extends StatefulWidget{
  const mysignup({super.key});

  State<mysignup> createState() => _mysignupState();
}


class _mysignupState extends State<mysignup>{


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
                  Colors.blue,
                  Colors.red
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
                      _auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                      ).
                      then((signInUser) {
                        FirebaseFirestore.instance.collection('myuser')
                            .add({
                          'email' : emailController.text,
                          'password' : passwordController.text,
                          'uid' : signInUser.user!.uid
                        })
                            .then((value)  {
                              if(signInUser != null){
                                print('sign in success');
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => myhome()));
                                });
                              }else{
                                print('something went wrong');
                              }
                        }).catchError((e){
                          print(e);
                        });
                      }).catchError((e){
                        print(e);
                      });
                    },
                  child: Text('Sign up'),
                  color: Colors.amber,
                  shape: ShapeBorder.lerp(RoundedRectangleBorder(), CircleBorder(), 5.0),

                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => mylogin()));
                  });
                },
                    child: Text('login')
                ),
                
                SizedBox(
                  height: 30,
                ),
                
                MaterialButton(
                  onPressed: () async{
                    await SignInWithGoogle().Signin();
                    // await Firebaseservice().signinwithgoogle();
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> myhome()));
                  },
                  child: Container(

                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,

                    ),
                    child: Center(child: Text('Sign in with google'),

                    ),
                  ),
                )
                
              ],
            ),
          ),
        ),
        );
  }
}