
import 'package:firebase/google/signinscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebaseservice.dart';
class HomePagescreen extends StatefulWidget {
  HomePagescreen({Key? key}) : super(key: key);

  @override
  _HomePagescreenState createState() => _HomePagescreenState();
}

class _HomePagescreenState extends State<HomePagescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,

          // on appbar text containing 'GEEKS FOR GEEKS'
          title: Text("home"),

      // In body text containing 'Home page ' in center

      ),
      body: Center(
        child:Column(
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            MaterialButton(
                onPressed: ()async{
                  await Firebaseservice().signout();
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SignInScreen()));

            },
              child: Text('signout'),

            ),
          ],
        ),
      ),
      ),
    );
  }
}