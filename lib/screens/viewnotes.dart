import 'package:flutter/material.dart';
import 'package:note/screens/sharepreferances.dart';

import 'home.dart';

class ViewNotes extends StatelessWidget {
  final Map<String, dynamic> data;
  ViewNotes({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var title = TextEditingController();
    var description = TextEditingController();
    title.text = data['title'];
    description.text = data['description'];
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: title,
                  enabled:false,
                  cursorColor: Colors.black,
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
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
                            color: Colors.black,
                            width: 1,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: TextField(
                  controller: description,
                  enabled: false,
                  cursorColor: Colors.black,
                  minLines: 9,
                  maxLines: 15,
                  keyboardType: TextInputType.text,
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
                            color: Colors.black,
                            width: 1,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Align(
                alignment: Alignment(0,0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      var id = await AppManager.getID();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(id: id,)));
                    },
                    child:Text('Back to All Notes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0xFF3F2E3E),),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
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
