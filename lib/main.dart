import 'package:flutter/material.dart';
import 'package:furnitureapp/UI/Screens/Home_Screen.dart';
import 'package:furnitureapp/UI/Utils/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Constants.darkTheme,
      home: const HomeScreen(),
    );
  }
}
