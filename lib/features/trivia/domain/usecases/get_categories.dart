import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category.dart';
import '../repositories/trivia_repository.dart';

class GetCategories {
  final TriviaRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, Categories>> call() {
    return repository.getCategories();
  }
}
