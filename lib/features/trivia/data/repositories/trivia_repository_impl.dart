// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/core/error/failures.dart';
import 'package:quiz_game/features/trivia/data/datasources/remote/trivia_remote_data_source.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';
import 'package:quiz_game/features/trivia/domain/entities/question.dart';

import '../../domain/repositories/trivia_repository.dart';

class TriviaRepositoryImpl implements TriviaRepository {
  final TriviaRemoteDataSource remoteDataSource;
  TriviaRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, Categories>> getCategories() async {
    try {
      final result = await remoteDataSource.loadCategories();
      return Right(result.toCategoriesEntity());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Questions>> getQuestions(
      int amount, QuestionDifficulty difficulty, int category) async {
    try {
      final result =
          await remoteDataSource.getQuestions(amount, difficulty, category);
      return Right(result.toQuestionsEntity());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
