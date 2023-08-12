import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/viewnotes.dart';

Widget AddNotesWigets(BuildContext context, Map<String, dynamic> data, String id, String docID) {

  void deleteData() async {
    await FirebaseFirestore.instance.collection('notes').doc(id).collection('personalNotes').doc(docID).delete();
  }

  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotes(data: data )));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 15, right: 5, left: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: -1,
              offset: Offset(3, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    data['title'],
                    style: TextStyle(
                        color: Color(0xFF3F2E3E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )),
              Spacer(),
              IconButton(
                onPressed: (){
                  deleteData();
                },
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            data['description'],
            style: TextStyle(
                color: Color(0xFF3F2E3E),
                fontSize: 14,
                fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
