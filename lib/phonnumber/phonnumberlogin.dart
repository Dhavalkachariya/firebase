
import 'package:firebase/phonnumber/phonnumberverify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class phonlogin extends StatefulWidget{
  const phonlogin({super.key});


  State<phonlogin> createState() => _phonloginState();
}

class _phonloginState extends State<phonlogin>{

  final auth = FirebaseAuth.instance;
  var phonnumberController = TextEditingController();
  bool loading = false;
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red
              ])
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black
                    ),
                    color: Colors.white
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phonnumberController,
                    decoration: InputDecoration(
                      hintText: '+91 123456789',

                    ),
                  ),


                ),
              ),

              SizedBox(
                height: 20,
              ),
             Container(
               height: 50,
               width: 200,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(
                     color: Colors.black
                 ),
                 color: Colors.lightGreen
               ),

               child: MaterialButton(
                   onPressed: (){
                     setState(() {
                       loading = true;
                     });

                     auth.verifyPhoneNumber(
                       phoneNumber: phonnumberController.text,
                         verificationCompleted: (e){
                         print(e);
                           setState(() {
                             loading = false;
                           });
                         },
                         verificationFailed: (e){
                         print(e);
                         },
                         codeSent: (String verificationid,int? token)
                         {
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context)=> phonverify(verificationid: verificationid),
                           ));
                           setState(() {
                             loading = false;
                           });
                         },
                         codeAutoRetrievalTimeout: (e){
                         print(e);
                           setState(() {
                             loading = false;
                           });
                         }
                     );
                   },
                 child: Text('login'),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}