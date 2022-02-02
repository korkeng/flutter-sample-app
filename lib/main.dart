import 'package:flutter/material.dart';
import 'package:sample_app/src/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Subject Condensed',
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
