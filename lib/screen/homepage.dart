import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class myhome extends StatefulWidget{
  const myhome({super.key});

  @override
State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome>{
  @override
  Widget build(BuildContext context){
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('myuser').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context , index){
                    var data = snapshot.data!.docs[index];
                      return Expanded(
                        child: Column(
                          children: [
                            Text(data['email']),
                          Text(data['name'])
                          ],
                        ),
                      );
                    }
                );

          })
        ],
      ),
    );
  }
}