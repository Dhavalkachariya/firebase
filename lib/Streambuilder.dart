import 'package:flutter/material.dart';


class StreamScreen extends StatefulWidget{
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen>{

  Stream<DateTime> getStream() async*{
    while(true){
      DateTime.now();
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream build'),
      ),
      // body: Container(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         StreamBuilder(
      //           stream: getStream(),
      //           builder: (context,snapshot){
      //             return Text(snapshot.data.toString());
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}