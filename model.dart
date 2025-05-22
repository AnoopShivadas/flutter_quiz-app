import 'dart:math' as math;

class Question {
  final String question;
  final List<String> possibleAnswers;
  final int correctAnswer;
  Question(this.question, this.possibleAnswers, this.correctAnswer);
}

class QuestionBank {
  final List<Question> _questions = _createQuestions();

  bool get hasNextQuestion => _questions.isNotEmpty;
  int get remainingQuestions => _questions.length;

  Question? getRandomQuestion() {
    if (_questions.isEmpty) {
      return null;
    }

    var i = math.Random().nextInt(_questions.length);
    var question = _questions[i];

    _questions.removeAt(i);
    return question;
  }
}

List<Question> _createQuestions() {
  return [
    Question(
      'Which planet is known as the Red Planet?',
      ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      1,
    ),
    Question(
      'What is the largest ocean on Earth?',
      [
        'Pacific Ocean',
        'Atlantic Ocean',
        'Indian Ocean',
        'Arctic Ocean',
      ],
      0,
    ),
    Question(
      'What gas do plants absorb from the atmosphere?',
      ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
      2,
    ),
    Question(
      'Which country invented Tea?',
      ['India', 'China', 'England', 'Japan'],
      1,
    ),
    Question(
      'Which is the longest river int the world?',
      ['Nile River', 'Amazon River', 'Ganga River', 'Godavari River'],
      0,
    ),
  ];
}
