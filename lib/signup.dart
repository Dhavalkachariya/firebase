import 'package:firebase/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'screen/homepage.dart';

class signuppage extends StatefulWidget{
  const signuppage({super.key});
  @override
  State<signuppage> createState()=> _signuppageState();
}

final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class _signuppageState extends State<signuppage>{

  signinuser()
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.toString(),
        password: passwordcontroller.text.toString())
        .then((signedInUser){
      UserManagement().storeNewUser(signedInUser, context);

    }
    )
        .catchError((e){
      print(e);
    });

  }

  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("signup"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: emailcontroller,
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
                controller: passwordcontroller,
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
            child: Text("sign in"),
              onPressed:() => signinuser(),
               ),
          ],


        ),
      ),

    );
  }
}