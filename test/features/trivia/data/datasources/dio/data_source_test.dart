import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/core/error/exceptions.dart';
import 'package:quiz_game/features/trivia/data/datasources/remote/dio/data_source.dart';
import 'package:quiz_game/features/trivia/data/datasources/remote/dio/data_source.mocks.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late DioDataSource dataSource;
  late MockDio dio;
  setUp(() {
    dio = MockDio();
    dataSource = DioDataSource(client: dio);
  });
  group("load trivia categories", () {
    test("should perform a GET request to the api", () async {
      // arrange
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: fixtureMap("trivia_category.json"),
          statusCode: 200,
        ),
      );
      // act
      dataSource.loadCategories();
      // assert
      verify(dio.get("https://opentdb.com/api_category.php"));
    });
    test("should throw exception when the status code is not  200", () async {
      // arrange
      when(dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            data: fixture("trivia_category_error.json"),
            statusCode: 404,
          ));
      // act
      final call = dataSource.loadCategories;
      // assert
      expect(
        () => call(),
        throwsA(
          const ServerException(
              "Something went wrong, check your internet connection"),
        ),
      );
    });
  });
  group("get questions", () {
    const tAmount = 10;
    const tQuestionDifficulty = QuestionDifficulty.medium;
    const tCategory = 10;
    test("should perform a GET request to the api", () async {
      // arrange
      when(dio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: fixture("trivia.json"),
          statusCode: 200,
        ),
      );
      // act
      dataSource.getQuestions(tAmount, tQuestionDifficulty, tCategory);
      // assert
      verify(
        dio.get(
          "https://opentdb.com/api.php",
          queryParameters: {
            "amount": tAmount,
            "category": tCategory,
            "difficulty": "medium",
            "type": "multiple",
          },
        ),
      );
    });
    test("should throw exception when the status code is not  200", () async {
      // arrange
      when(dio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: fixture("trivia_error.json"),
                statusCode: 404,
              ));
      // act
      final call = dataSource.getQuestions;
      // assert
      expect(
        () => call(tAmount, tQuestionDifficulty, tCategory),
        throwsA(
          const ServerException(
              "Something went wrong, check your internet connection"),
        ),
      );
    });
    test("should throw exception when the response code is not 0", () async {
      // arrange
      when(dio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: fixture("trivia_error.json"),
                statusCode: 200,
              ));
      // act
      final call = dataSource.getQuestions;
      // assert
      expect(
        () => call(tAmount, tQuestionDifficulty, tCategory),
        throwsA(
          const ServerException("Something went wrong, try again later"),
        ),
      );
    });
  });
}
