import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/addNote.dart';
import 'package:note/screens/home.dart';
import 'package:note/screens/sharepreferances.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appID = await AppManager.getID();
  if(appID == ''){
    var id = Uuid().v1();
    print(id);
    AppManager.saveID(id);
    appID = id;
  }


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(id: appID,),
        'addNote': (context) => AddNote(id: appID,),
      },
    ),
  );

}
