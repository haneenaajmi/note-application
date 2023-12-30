import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/view/home_screen/home_screen.dart';

// Future<void> main() async {
//   // initialize flutter
//   await Hive.initflutter();

//   // register adapter
//   Hive.registerAdapter(NoteModelAdapter());

//   // open database box
//   var box = await Hive.openBox('noteBox');
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
