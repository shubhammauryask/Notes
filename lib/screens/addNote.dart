import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/home.dart';

class AddNote extends StatelessWidget {
  final String id;
  AddNote({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var title = TextEditingController();
    var description = TextEditingController();
    void saveData() async {
      if(title.text.isNotEmpty && description.text.isNotEmpty){
        FirebaseFirestore.instance
            .collection('notes')
            .doc(id)
            .collection('personalNotes')
            .add({
          'title': title.text.trim().toString(),
          'description': description.text.trim().toString(),
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(id: id))
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: title,
                  cursorColor: Colors.black,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                      ),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: description,
                  cursorColor: Colors.black,
                  minLines: 9,
                  maxLines: 9,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'description',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                      ),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    child: Text(
                      'Save Note',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3F2E3E),
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
