

import 'package:firebase/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class phonverify extends StatefulWidget{
 final String verificationid ;
  const phonverify({super.key , required this.verificationid});


  @override
  State<phonverify> createState() => _phonverifyState();
}

class _phonverifyState extends State<phonverify>{

  final auth = FirebaseAuth.instance;
  var phonverifyController = TextEditingController();
  bool loading = true;

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.deepPurpleAccent
                ])
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextFormField(
                  controller: phonverifyController,
                  decoration: InputDecoration(
                    hintText: '6 digit code',

                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black
                    ),
                    color: Colors.cyan
                  );
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: phonverifyController.text.toString()
                  );

                  try{
                    await auth.signInWithCredential(credential);

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> myhome()));
                    setState(() {
                      loading = false;
                    });
                  }
                      catch(e){
                    print(e);
                        setState(() {
                          loading = false;
                        });
                      }
                },
                child: Text('verify'),
              )
            ],
          ),
        ),
      ),
    );
  }
}