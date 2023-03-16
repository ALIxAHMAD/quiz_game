import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.mocks.dart';
import 'package:quiz_game/features/trivia/domain/usecases/get_categories.dart';

void main() {
  late GetCategories useCase;
  late MockTriviaRepository mockTriviaRepository;
  setUp(() {
    mockTriviaRepository = MockTriviaRepository();
    useCase = GetCategories(mockTriviaRepository);
  });

  final tCategories = Categories(categories: []);
  test("GetCategories use case test", () async {
    // arrange
    when(mockTriviaRepository.getCategories())
        .thenAnswer((_) async => Right(tCategories));
    // act
    final result = await useCase();
    // assert
    verify(mockTriviaRepository.getCategories());
    expect(result, Right(tCategories));
  });
}
