import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_game/features/trivia/data/models/question_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tQuestionsModel = QuestionsModel(questions: [
    QuestionModel(
      questionsText: "Test Text",
      inCorrectAnswers: [
        "Test Text",
        "Test Text",
        "Test Text",
      ],
      correctAnswer: "Test Text",
    ),
    QuestionModel(
      questionsText: "Test Text",
      inCorrectAnswers: [
        "Test Text",
        "Test Text",
        "Test Text",
      ],
      correctAnswer: "Test Text",
    ),
    QuestionModel(
      questionsText: "Test Text",
      inCorrectAnswers: [
        "Test Text",
        "Test Text",
        "Test Text",
      ],
      correctAnswer: "Test Text",
    ),
  ]);

  test("question model from json", () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
    // act
    final result = (jsonMap['results'] as List).map(
      (e) => QuestionModel.fromJson(e),
    );
    final questionsResult = QuestionsModel(questions: [...result]);
    // assert
    expect(questionsResult, tQuestionsModel);
  });
}
