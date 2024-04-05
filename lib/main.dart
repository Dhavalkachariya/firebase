//
// import 'package:firebase/signup.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'loginpage.dart';
// import 'package:firebase/homepage.dart';
//
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     routes: {
//       '/': (context) => const login(),
//       'signup': (context) => const signuppage(),
//       'myhome': (context) => const myhome(),
//     },
//   ));
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'readData.dart';
//
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});//, required this.title});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CRUD Operation Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.cyan
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HomePage',style: TextStyle(color: Colors.white),),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(onPressed: (){
//               //to create data in collection statically
//               /*await FirebaseFirestore.instance.collection('Students').doc('studinfo').set({
//                 'name':'Trd',
//                 'enrollno':'1',
//               });*/
//
//               //to create data in a collection dynamically
//               create('Employee', 'EmpDetail2', 'ttt', 2);
//             }, child: Text('Create')
//             ),
//             ElevatedButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder:(context)=>readdata()));
//             }, child: Text('Read/Retrieve')
//             ),
//             ElevatedButton(onPressed: (){
//               update('Employee', 'EmpDetail', 'name', 'ttt');
//             }, child: Text('Update')
//             ),
//             ElevatedButton(onPressed: (){
//               delete('Employee', 'EmpDetail');
//             }, child: Text('Delete')
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void create(String collectionname,String docname,String name1,int enrollno1)async
//   {
//     await FirebaseFirestore
//         .instance
//         .collection(collectionname)
//         .doc(docname)
//         .set(
//         {
//           'name': name1,
//           'enrollno':enrollno1
//         });
//   }
//   void update(String collectionname,String docname,String fieldname,var newfieldval)async
//   {
//     await FirebaseFirestore
//         .instance
//         .collection(collectionname)
//         .doc(docname)
//         .update({fieldname:newfieldval});
//   }
//   void delete(String collectionname,String docname)async
//   {
//     await FirebaseFirestore
//         .instance
//         .collection(collectionname)
//         .doc(docname)
//         .delete();
//   }
// }
//

import 'package:firebase/screen/mysignup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase/Streambuilder.dart';

import 'firebserealtime/realtimeDatabase.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //   FirebaseOptions(
  //     apiKey: "AIzaSyAe1oHtQQhj-E7-ZjkVgJjpvPoW1pHrP8o",
  //     projectId: "fires-7d2e3",
  //     messagingSenderId: "1039216003662",
  //     appId: "1:1039216003662:web:910cd08330f97ca35c911f"
  // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first',
      routes: {
        'first':(context)=> RealTime(),
        // 'login':(context)=>login(),
        // 'register':(context)=>register(),
        // 'home':(context)=>homepage(),
      },
      title: 'Login firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}


