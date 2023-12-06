import 'package:flutter/material.dart';
import 'package:note_app/view/home_screen/home_screen.dart';

void main()
{runApp(MyApp());
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