// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:quiz_game/core/error/failures.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';

import '../../../../core/enums/question_difficulty.dart';
import '../entities/question.dart';

class GetQuestions {
  final TriviaRepository repository;
  GetQuestions({
    required this.repository,
  });
  Future<Either<Failure, Questions>> call(
    int amount,
    QuestionDifficulty difficulty,
    int category,
  ) {
    return repository.getQuestions(amount, difficulty, category);
  }
}
