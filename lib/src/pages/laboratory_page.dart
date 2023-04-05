import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/src/pages/laboratory_result_page.dart';

class LaboratoryPage extends StatefulWidget {
  LaboratoryPage({Key? key}) : super(key: key);

  @override
  _LaboratoryPageState createState() => _LaboratoryPageState();
}

class _LaboratoryPageState extends State<LaboratoryPage> {
  // Question No.1
  final List<int> numberListLab1 = [1, 2, 3, 4, 5];
  final List<String> charListLab1 = ['A', 'B', 'C', 'D', 'E'];

  // Question No.2
  final List<int> numberListLab2 = [6, 7, 8, 9, 10];
  final List<String> charListLab2 = ['A', 'B', 'C', 'D', 'E'];

  int _currentScoreLab1 = 0;
  int _currentScoreLab2 = 0;
  int _currentQuestion = 1;

  void _validateAnswer(int answer, String answer2) {
    bool isCorrect = false;

    if (answer == 1 && answer2 == 'E' ||
        answer == 2 && answer2 == 'D' ||
        answer == 3 && answer2 == 'B' ||
        answer == 4 && answer2 == 'C' ||
        answer == 5 && answer2 == 'A' ||
        answer == 6 && answer2 == 'B' ||
        answer == 7 && answer2 == 'C' ||
        answer == 8 && answer2 == 'A' ||
        answer == 9 && answer2 == 'E' ||
        answer == 10 && answer2 == 'D') {
      isCorrect = true;
    }
    if (answer <= 5) {
      charListLab1.removeWhere((e) => e == answer2);
      numberListLab1.removeWhere((e) => e == answer);
      if (isCorrect) _currentScoreLab1++;
    } else {
      charListLab2.removeWhere((e) => e == answer2);
      numberListLab2.removeWhere((e) => e == answer);
      if (isCorrect) _currentScoreLab2++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(TranslationKey.laboratory))),
      body: (_currentQuestion == 1 ? numberListLab1.length > 0 : numberListLab2.length > 0)
          ? Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.only(bottom: 34),
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 2.5,
                    child: Image.asset(
                      _currentQuestion == 1 ? ImagePath.lab1 : ImagePath.lab2,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _currentQuestion == 1 ? numberListLab1.length : numberListLab2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Draggable<int>(
                                data: _currentQuestion == 1 ? numberListLab1[index] : numberListLab2[index], // isHidden
                                feedback: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Text(
                                    _currentQuestion == 1
                                        ? numberListLab1[index].toString()
                                        : numberListLab2[index].toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Subject Condensed',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                childWhenDragging: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Text(
                                    _currentQuestion == 1
                                        ? numberListLab1[index].toString()
                                        : numberListLab2[index].toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Subject Condensed',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Text(
                                    _currentQuestion == 1
                                        ? numberListLab1[index].toString()
                                        : numberListLab2[index].toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Subject Condensed',
                                    ),
                                  ),
                                ),
                              ),
                              DragTarget<int>(
                                builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(color: Colors.redAccent),
                                    ),
                                    child: Text(
                                      _currentQuestion == 1 ? charListLab1[index] : charListLab2[index],
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Subject Condensed',
                                      ),
                                    ),
                                  );
                                },
                                onAccept: (int answer) {
                                  setState(() {
                                    _validateAnswer(
                                      answer,
                                      _currentQuestion == 1 ? charListLab1[index] : charListLab2[index],
                                    );
                                  });
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 24),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    _currentQuestion == 1
                        ? 'คุณได้ทำแบบทดสอบข้อ 1 เสร็จแล้ว\nกดปุ่มด้านล่างเพื่อทำแบบทดสอบข้อถัดไป'
                        : 'คุณได้ทำแบบทดสอบครบทั้ง 2 ข้อแล้ว\nกดปุ่มด้านล่างเพื่อดูคะแนน',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Subject Condensed',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _currentQuestion == 1
                        ? setState(() {
                            _currentQuestion++;
                          })
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LaboratoryResultPage(
                                scoreQuestion1: _currentScoreLab1,
                                scoreQuestion2: _currentScoreLab2,
                              ),
                            ),
                          );
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Subject Condensed',
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(const Size(256, 56)),
                  ),
                  child: Text(
                    _currentQuestion == 1 ? 'ทำแบบทดสอบข้อที่ 2' : 'ดูผลคะแนน',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Subject Condensed',
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
