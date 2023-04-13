// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/core/error/exceptions.dart';
import 'package:quiz_game/features/trivia/data/datasources/remote/trivia_remote_data_source.dart';
import 'package:quiz_game/features/trivia/data/models/category_model.dart';
import 'package:quiz_game/features/trivia/data/models/question_model.dart';

@GenerateNiceMocks([MockSpec<Dio>(as: #MockDio)])
class DioDataSource implements TriviaRemoteDataSource {
  final Dio client;
  DioDataSource({
    required this.client,
  });
  int responseCode(Map<String, dynamic> json) {
    final int code = json["response_code"];
    return code;
  }

  @override
  Future<QuestionsModel> getQuestions(
      int amount, QuestionDifficulty difficulty, int category) async {
    late final String difficultyString;
    switch (difficulty) {
      case QuestionDifficulty.easy:
        difficultyString = "easy";
        break;
      case QuestionDifficulty.hard:
        difficultyString = "hard";
        break;
      case QuestionDifficulty.medium:
        difficultyString = "medium";
        break;
    }
    final response = await client.get(
      "https://opentdb.com/api.php",
      queryParameters: {
        "amount": amount,
        "category": category,
        "difficulty": difficultyString,
        "type": "multiple",
      },
    );
    if (response.statusCode != 200) {
      throw const ServerException(
          "Something went wrong, check your internet connection");
    }
    if (responseCode(response.data) != 0) {
      throw const ServerException("Something went wrong, try again later");
    }
    final result = (response.data['results'] as List).map(
      (e) => QuestionModel.fromJson(e),
    );
    return QuestionsModel(questions: [...result]);
  }

  @override
  Future<CategoriesModel> getCategories() async {
    final response = await client.get("https://opentdb.com/api_category.php");
    if (response.statusCode != 200) {
      throw const ServerException(
          "Something went wrong, check your internet connection");
    }

    final result = (response.data["trivia_categories"])
        .map((e) => CategoryModel.fromJson(e));
    return CategoriesModel(categories: [...result]);
  }
}
