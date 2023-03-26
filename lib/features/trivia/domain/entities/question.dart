// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  const Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });

  @override
  List<Object?> get props => [questionText, answers, correctAnswerIndex];
}

class Questions extends Equatable {
  final List<Question> questions;
  const Questions({
    required this.questions,
  });

  @override
  List<Object?> get props => [questions];
}
