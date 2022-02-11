class QuestionModel {
  late final int? no;
  late final String? question;
  late final List<String>? choise;

  QuestionModel({
    this.no,
    this.question,
    this.choise,
  });
}

class Question {
  static final getQuestionList = [
    QuestionModel(
      no: 1,
      question: '1 + 1 = ?',
      choise: ['1', '2', '3', '4'],
    ),
    QuestionModel(
      no: 2,
      question: 'ตัวอย่างคำถาม ตัวอย่างคำถาม ตัวอย่างคำถาม ตัวอย่างคำถาม ?',
      choise: [
        'ตัวอย่างตัวเลือก 1',
        'ตัวอย่างตัวเลือก 2 ตัวอย่างตัวเลือก 2',
        'ตัวอย่างตัวเลือก 3 ตัวอย่างตัวเลือก 3 ตัวอย่างตัวเลือก 3',
        'ตัวอย่างตัวเลือก 4 ตัวอย่างตัวเลือก 4 ตัวอย่างตัวเลือก 4 ตัวอย่างตัวเลือก 4',
      ],
    ),
    QuestionModel(
      no: 3,
      question: '3 + 4 = ?',
      choise: ['5', '6', '7', '8'],
    ),
  ];
}
