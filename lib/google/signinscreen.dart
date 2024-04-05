//SignInScreen

import 'package:firebase/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase/google/homepagescreen.dart';
import 'firebaseservice.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
 Widget build(BuildContext context){
   return SafeArea(
     child: Scaffold(
       body: Container(
           decoration: BoxDecoration(
               gradient: LinearGradient(
                   colors: [
                   Colors.blue,
                     Colors.redAccent,

                   ]
               )
           ),

         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,

           children: [
             Container(
               child: MaterialButton(
                 color: Colors.teal[100],
                 elevation: 10,
                 onPressed: ()async{
                   await Firebaseservice().signinwithgoogle();

                   Navigator.push(context, MaterialPageRoute(builder: (_) => HomePagescreen()));
                 },
                 child: Center(
                   child: Container(
                     child: Row(
                       children: [
                         Container(
                           height: 30,
                           width: 30,
                             decoration: BoxDecoration(
                           border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              image: AssetImage('android/asset/google_logo.jpeg'),
                              fit: BoxFit.cover
                            ),
                           shape:BoxShape.circle
                         )),
                         SizedBox(
                           width: 20,
                         ),

                         Text('sign in with google')
                       ],
                     ),

                   ),
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
