import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';

class LaboratoryResultPage extends StatefulWidget {
  final int scoreQuestion1;
  final int scoreQuestion2;

  const LaboratoryResultPage({
    Key? key,
    required this.scoreQuestion1,
    required this.scoreQuestion2,
  }) : super(key: key);

  @override
  State<LaboratoryResultPage> createState() => _LaboratoryResultPageState();
}

class _LaboratoryResultPageState extends State<LaboratoryResultPage> {
  final int maxScorePerQuestion = 5;
  int totalScore = 0;

  @override
  void initState() {
    setState(() {
      totalScore = widget.scoreQuestion1 + widget.scoreQuestion2;
    });
    super.initState();
  }

  Widget _renderReactionImage() {
    String path = '';
    if (totalScore > 8)
      path = ImagePath.emoteTier1;
    else if (totalScore > 6)
      path = ImagePath.emoteTier2;
    else if (totalScore > 4)
      path = ImagePath.emoteTier3;
    else if (totalScore > 2)
      path = ImagePath.emoteTier4;
    else
      path = ImagePath.emoteTier5;

    return Image.asset(
      path,
      width: 200,
      height: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(tr(TranslationKey.laboratoryResultTitle)),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _renderReactionImage(),
              Text(
                'คะแนนข้อที่ 1 : ${widget.scoreQuestion1}/$maxScorePerQuestion คะแนน',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                'คะแนนข้อที่ 2 : ${widget.scoreQuestion2}/$maxScorePerQuestion คะแนน',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                'รวม $totalScore/${maxScorePerQuestion * 2} คะแนน',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
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
                child: Text('กลับไปหน้าแรก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
