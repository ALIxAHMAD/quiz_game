// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:equatable/equatable.dart';

import '../../domain/entities/question.dart';

class QuestionModel extends Equatable {
  final String questionsText;
  final List<String> inCorrectAnswers;
  final String correctAnswer;
  const QuestionModel({
    required this.questionsText,
    required this.inCorrectAnswers,
    required this.correctAnswer,
  });

  @override
  List<Object?> get props => [questionsText, inCorrectAnswers, correctAnswer];

  Question toEntity() {
    final randomIndex = Random().nextInt(inCorrectAnswers.length);
    final answers = inCorrectAnswers..insert(randomIndex, correctAnswer);

    return Question(
      questionText: questionsText,
      answers: answers,
      correctAnswerIndex: randomIndex,
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionsText: json["question"],
      inCorrectAnswers: (json["incorrect_answers"] as List)
          .map((answer) => answer.toString())
          .toList(),
      correctAnswer: json["correct_answer"],
    );
  }
}

class QuestionsModel extends Equatable {
  final List<QuestionModel> questions;
  const QuestionsModel({
    required this.questions,
  });

  @override
  List<Object?> get props => [questions];
}
