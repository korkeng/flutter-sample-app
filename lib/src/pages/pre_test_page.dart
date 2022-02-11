import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/assets/questions/questions.dart';
import 'package:sample_app/src/components/custom_appbar.dart';
import 'package:sample_app/src/pages/test_result_page.dart';

class PreTestPage extends StatefulWidget {
  PreTestPage({Key? key}) : super(key: key);

  @override
  _PreTestPageState createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  int _currentTask = 1;
  final List<int> _currentAnswer = [];
  int? _maxTask;

  final List<QuestionModel> questionList = Question.getQuestionList;

  @override
  void initState() {
    super.initState();
    _setDefaultDataToList();
    _maxTask = questionList.length;
  }

  void _setDefaultDataToList() {
    for (int _i = 0; _i < questionList.length; _i++) {
      _currentAnswer.add(99);
    }
  }

  Widget? _renderChoiseList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: questionList[_currentTask - 1].choise!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            questionList[_currentTask - 1].choise![index],
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Subject Condensed',
            ),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.all(Colors.blueAccent),
            activeColor: Colors.blueGrey,
            value: index,
            groupValue: _currentAnswer[_currentTask - 1],
            onChanged: (_) {
              setState(() {
                _currentAnswer[_currentTask - 1] = index;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: tr(TranslationKey.preTestTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24),
              alignment: Alignment.center,
              child: Text(
                'ข้อที่ $_currentTask / $_maxTask',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 8,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        const TextSpan(
                          text: 'คำถาม : ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Subject Condensed',
                          ),
                        ),
                        TextSpan(
                          text: questionList[_currentTask - 1].question ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Subject Condensed',
                          ),
                        ),
                      ]),
                    ),
                    const Divider(
                      color: Colors.blueAccent,
                      thickness: 1.5,
                    ),
                    _renderChoiseList() ?? Container(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_currentTask <= 1) {
                        return;
                      }
                      setState(() {
                        _currentTask--;
                      });
                    },
                    style: ButtonStyle(
                      enableFeedback: false,
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Subject Condensed',
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(132, 56)),
                      backgroundColor: _currentTask <= 1
                          ? MaterialStateProperty.all(Colors.grey)
                          : null,
                    ),
                    child: const Text('ข้อก่อนหน้า'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentTask >= _maxTask!) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => TestResultPage(),
                          ),
                        );
                        return;
                      }
                      setState(() {
                        _currentTask++;
                      });
                    },
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Subject Condensed',
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(132, 56)),
                    ),
                    child: Text(
                        _currentTask >= _maxTask! ? 'ส่งคำตอบ' : 'ข้อถัดไป'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
