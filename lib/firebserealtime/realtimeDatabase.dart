import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebserealtime/realtimeDatabase.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RealTime extends StatefulWidget {
  const RealTime({super.key});

  @override
  State<RealTime> createState() => _RealTimeState();
}

class _RealTimeState extends State<RealTime> {


  final ref = FirebaseDatabase.instance.ref('dhaval');
  final dataController = TextEditingController();
  final updateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Time DataBase'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: dataController,
              decoration: InputDecoration(

               label: Text('enter data'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width: 2),

                )

              ),
            ),
          ),

          FirebaseAnimatedList(
            shrinkWrap: true,
              query: FirebaseDatabase.instance.reference().child('dhaval'),
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, index){

                return Card(
                  child: ListTile(
                    onTap: (){
                      updatepopup(context,snapshot.child('id').value.toString());
                      updateController.text = snapshot.child('title').value.toString();
                    },
                    title: Text(snapshot.child('title').value.toString()),
                  ),
                );

              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          sendData();

        },
        child: Icon(Icons.send),
      ),
    );
  }


  void sendData() {
    ref.child(DateTime.now().millisecond.toString()).set(
      {
        'id':DateTime.now().millisecond,
        'title':dataController.text
      }

    ).then((value) {
      Fluttertoast.showToast(
          msg: 'Data Add successfully',
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 16,
        toastLength: Toast.LENGTH_LONG
      );
      dataController.clear();
    });
  }

  void updatedData(String id){
    ref.child(id).update({
      'id':id,
      'title':updateController.text
    });
  }

  void deleteData (String id){
    ref.child(id).remove();
  }

  void updatepopup(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
              height: 300,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: updateController,
                        decoration: InputDecoration(
                      
                            label: Text('update data'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 2),
                      
                            )
                      
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          updatedData(id);
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.update),
                      ),
                    ),
                    Expanded(child: GestureDetector(
                      onTap: (){

                        deleteData(id);
                        Navigator.pop(context);
                      },
                      child: Text('delete'),
                    ))
                  ],
                ),
              ),
            ),
          );
        },);
  }
}
