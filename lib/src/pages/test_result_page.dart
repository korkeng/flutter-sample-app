import 'package:flutter/material.dart';
import 'package:sample_app/src/components/custom_appbar.dart';

class TestResultPage extends StatefulWidget {
  TestResultPage({Key? key}) : super(key: key);

  @override
  _TestResultPageState createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'คะแนนการสอบ Pre-test',
      ),
      body: Container(),
    );
  }
}
