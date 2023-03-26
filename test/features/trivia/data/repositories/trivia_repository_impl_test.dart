import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/core/error/failures.dart';
import 'package:quiz_game/features/trivia/data/datasources/trivia_remote_data_source.mocks.dart';
import 'package:quiz_game/features/trivia/data/models/category_model.dart';
import 'package:quiz_game/features/trivia/data/models/question_model.dart';
import 'package:quiz_game/features/trivia/data/repositories/trivia_repository_impl.dart';

void main() {
  late TriviaRepositoryImpl repositoryImpl;
  late MockTriviaRemoteDataSource remoteDataSource;
  setUp(() {
    remoteDataSource = MockTriviaRemoteDataSource();
    repositoryImpl = TriviaRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group("get categories", () {
    const tCategoriesModel = CategoriesModel(categories: []);
    final tCategories = tCategoriesModel.toCategoriesEntity();
    test(
        "should return remote data when the call to remote data source successful",
        () async {
      // arrange
      when(remoteDataSource.loadCategories())
          .thenAnswer((_) async => tCategoriesModel);
      // act
      final result = await repositoryImpl.getCategories();
      // assert
      verify(remoteDataSource.loadCategories());
      expect(result, Right(tCategories));
    });
    test(
        "should return failure when the call to remote data source unsuccessful",
        () async {
      // arrange
      when(remoteDataSource.loadCategories()).thenThrow(
          Exception("Something went wrong, check internet connection"));
      // act
      final result = await repositoryImpl.getCategories();
      // assert
      verify(remoteDataSource.loadCategories());
      expect(
          result,
          equals(const Left(ServerFailure(
              "Exception: Something went wrong, check internet connection"))));
    });
  });
  group("get questions", () {
    const tQuestionsModel = QuestionsModel(
      questions: [],
    );
    final tQuestions = tQuestionsModel.toQuestionsEntity();
    test(
        "should return remote data when the call to remote data source successful",
        () async {
      // arrange
      when(remoteDataSource.getQuestions(any, any, any))
          .thenAnswer((_) async => tQuestionsModel);
      // act
      final result =
          await repositoryImpl.getQuestions(10, QuestionDifficulty.medium, 2);
      // assert
      verify(remoteDataSource.getQuestions(10, QuestionDifficulty.medium, 2));
      expect(result, Right(tQuestions));
    });
    test(
        "should return failure when the call to remote data source unsuccessful",
        () async {
      // arrange
      when(remoteDataSource.getQuestions(any, any, any)).thenThrow(
          Exception("Something went wrong, check internet connection"));
      // act
      final result =
          await repositoryImpl.getQuestions(10, QuestionDifficulty.medium, 2);
      // assert
      verify(remoteDataSource.getQuestions(10, QuestionDifficulty.medium, 2));
      expect(
          result,
          equals(const Left(ServerFailure(
              "Exception: Something went wrong, check internet connection"))));
    });
  });
}
