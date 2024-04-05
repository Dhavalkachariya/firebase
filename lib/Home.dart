import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget
{
  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign In as ',style: TextStyle(fontSize: 16),),
          SizedBox(
            height: 8,
          ),
          Text(user.email!,
            style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
            icon: Icon(Icons.arrow_back,size: 32,),
            label: Text('Sign Out',
              style: TextStyle(fontSize: 24),),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'first');
            }, )
        ],
      ),
    );
  }
}

