// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

class Questions {
  final List<Question> questions;
  Questions({
    required this.questions,
  });
}
