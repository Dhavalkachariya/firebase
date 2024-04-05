import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class readdata extends StatefulWidget
{
  @override
  State<readdata> createState() => _readdataState();
}

class _readdataState extends State<readdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Readdata Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Employee').snapshots(),
          builder: (context,empSnapshot){
            if(empSnapshot.connectionState == ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else
            {
              final empDocs=empSnapshot.data!.docs;
              return ListView.builder(
                  itemCount: empDocs.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(empDocs[index]['name']),
                        subtitle: Text(empDocs[index]['enrollno'].toString()),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
