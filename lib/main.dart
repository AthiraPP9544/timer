import 'package:flutter/material.dart';
import 'package:timer/screen/second.dart';



void main() {
  runApp(const MyyApp());
}

class MyyApp extends StatelessWidget {
  const MyyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var green1;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Focus Timer',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: green1, size: 27))),
      home:  CountdownClockPage(),
    );
  }
}

