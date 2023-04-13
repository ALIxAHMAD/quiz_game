import '../../models/category_model.dart';
import '../../models/question_model.dart';

import '../../../../../core/enums/question_difficulty.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(
    [MockSpec<TriviaRemoteDataSource>(as: #MockTriviaRemoteDataSource)])
abstract class TriviaRemoteDataSource {
  Future<CategoriesModel> getCategories();
  Future<QuestionsModel> getQuestions(
    int amount,
    QuestionDifficulty difficulty,
    int category,
  );
}
