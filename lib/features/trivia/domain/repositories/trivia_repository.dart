import 'package:dartz/dartz.dart';
import '../../../../core/enums/question_difficulty.dart';
import '../../../../core/error/failures.dart';
import '../entities/category.dart';
import '../entities/question.dart';
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
