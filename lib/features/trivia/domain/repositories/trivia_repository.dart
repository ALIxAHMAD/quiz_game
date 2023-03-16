import 'package:dartz/dartz.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/core/error/failures.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';
import 'package:quiz_game/features/trivia/domain/entities/question.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TriviaRepository>(as: #MockTriviaRepository)])
abstract class TriviaRepository {
  Future<Either<Failure, Categories>> getCategories();
  Future<Either<Failure, Questions>> getQuestions(
    int amount,
    QuestionDifficulty difficulty,
    int category,
  );
}
