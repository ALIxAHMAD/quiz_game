import 'package:dartz/dartz.dart';
import 'package:quiz_game/core/error/failures.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';

class GetCategories {
  final TriviaRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, Categories>> call() {
    return repository.getCategories();
  }
}
