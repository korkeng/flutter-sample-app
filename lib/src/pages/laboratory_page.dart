import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';

class LaboratoryPage extends StatefulWidget {
  LaboratoryPage({Key? key}) : super(key: key);

  @override
  _LaboratoryPageState createState() => _LaboratoryPageState();
}

class _LaboratoryPageState extends State<LaboratoryPage> {
  final List<int> numberListLab1 = [1, 2, 3, 4, 5];
  final List<String> charListLab1 = ['A', 'B', 'C', 'D', 'E'];

  int _currentScoreLab1 = 0;

  void _validateAnswer(int answer, String answer2) {
    if (answer == 1 && answer2 == 'E' ||
        answer == 2 && answer2 == 'D' ||
        answer == 3 && answer2 == 'B' ||
        answer == 4 && answer2 == 'C' ||
        answer == 5 && answer2 == 'A') {
      _currentScoreLab1++;
    }
    print('score = $_currentScoreLab1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(TranslationKey.laboratory))),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.only(bottom: 34),
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 2.5,
              child: Image.asset(
                ImagePath.lab1,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: numberListLab1.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Draggable<int>(
                          data: numberListLab1[index], // isHidden
                          feedback: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Text(
                              numberListLab1[index].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Subject Condensed',
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
                              numberListLab1[index].toString(),
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
                                charListLab1[index],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Subject Condensed',
                                ),
                              ),
                            );
                          },
                          onAccept: (int answer) {
                            print(charListLab1[index]);
                            print(answer);
                            setState(() {
                              _validateAnswer(answer, charListLab1[index]);
                              charListLab1.removeWhere((e) => e == charListLab1[index]);
                              numberListLab1.removeWhere((e) => e == answer);
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
      ),
    );
  }
}
