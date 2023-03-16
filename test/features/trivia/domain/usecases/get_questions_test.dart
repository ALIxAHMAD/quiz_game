import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/features/trivia/domain/entities/question.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.mocks.dart';
import 'package:quiz_game/features/trivia/domain/usecases/get_questions.dart';

void main() {
  late GetQuestions useCase;
  late MockTriviaRepository mockTriviaRepository;
  setUp(() {
    mockTriviaRepository = MockTriviaRepository();
    useCase = GetQuestions(repository: mockTriviaRepository);
  });
  final tQuestions = Questions(questions: []);
  const tAmount = 10;
  const tQuestionDifficulty = QuestionDifficulty.medium;
  const tCategory = 10;
  test("GetQuestions use case test", () async {
    // arrange
    when(mockTriviaRepository.getQuestions(any, any, any))
        .thenAnswer((_) async => Right(tQuestions));
    // act
    final result = await useCase(tAmount, tQuestionDifficulty, tCategory);
    // assert
    verify(mockTriviaRepository.getQuestions(
      tAmount,
      tQuestionDifficulty,
      tCategory,
    ));
    expect(result, Right(tQuestions));
  });
}
