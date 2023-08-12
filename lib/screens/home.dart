import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/addNote.dart';

import '../widgets/addNotesWidgets.dart';

class Home extends StatelessWidget {
  final String id;
  Home({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
            'All Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('notes').doc(id).collection('personalNotes').snapshots(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return AddNotesWigets(context, snapshot.data!.docs[index].data() as Map<String, dynamic>, id, snapshot.data!.docs[index].id);
                  },
                );
              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote(id: id,)));
        },
        backgroundColor: Colors.greenAccent,
        child: Image.asset(
          'assets/images/add.png',
          height: MediaQuery.of(context).size.height * 0.04,
          color: Color(0xFFE2703A),
        ),
      ),
    );
  }
}
