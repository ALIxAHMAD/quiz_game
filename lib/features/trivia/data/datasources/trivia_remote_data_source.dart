import 'package:quiz_game/features/trivia/data/models/category_model.dart';
import 'package:quiz_game/features/trivia/data/models/question_model.dart';

import '../../../../core/enums/question_difficulty.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(
    [MockSpec<TriviaRemoteDataSource>(as: #MockTriviaRemoteDataSource)])
abstract class TriviaRemoteDataSource {
  Future<CategoriesModel> loadCategories();
  Future<QuestionsModel> getQuestions(
    int amount,
    QuestionDifficulty difficulty,
    int category,
  );
}
