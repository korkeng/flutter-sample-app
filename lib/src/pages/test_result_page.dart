import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/questions/questions.dart';
import 'package:sample_app/src/components/custom_appbar.dart';
import 'package:sample_app/src/pages/main_page.dart';

class TestResultPage extends StatefulWidget {
  List<int> answerList;
  List<QuestionModel> questionList;

  TestResultPage({
    Key? key,
    required this.answerList,
    required this.questionList,
  }) : super(key: key);

  @override
  _TestResultPageState createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  int totalScore = 0;
  int totalQuestion = 0;

  @override
  void initState() {
    super.initState();
    totalQuestion = widget.answerList.length;
    _verifyAnswer();
  }

  void _verifyAnswer() {
    int _idx = 0;
    for (var element in widget.answerList) {
      if (element + 1 == widget.questionList[_idx].correctAnswer) {
        totalScore++;
      }
      _idx++;
    }
  }

  Widget _renderReactionImage() {
    String path = '';
    if (totalScore >= 3) {
      path = ImagePath.smile;
    } else if (totalScore >= 2) {
      path = 'nuetral';
    } else {
      path = 'unhappy';
    }
    return Image.asset(
      path,
      width: 200,
      height: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'คะแนนการสอบ Pre-test',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderReactionImage(),
            const Text(
              'คะแนนของคุณ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Subject Condensed',
              ),
            ),
            Text(
              '$totalScore / $totalQuestion',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Subject Condensed',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text('Back to Main Page'),
            )
          ],
        ),
      ),
    );
  }
}
