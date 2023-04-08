import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';
import 'package:quiz_game/features/trivia/domain/usecases/get_categories.dart';
import 'package:quiz_game/features/trivia/domain/usecases/get_questions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetQuestions getQuestions;
  final GetCategories getCategories;
  HomeCubit({required TriviaRepository repository})
      : getCategories = GetCategories(repository),
        getQuestions = GetQuestions(repository),
        super(HomeState.init());

  void init() async {
    emit(state.copyWith(isLoading: true, errorMessage: ""));
    final result = await getCategories();
    result.fold((l) {
      emit(state.copyWith(errorMessage: l.message, isLoading: false));
    }, (r) {
      emit(state.copyWith(categories: r, isLoading: false));
    });
  }

  void choseCategory(Category category) {
    emit(state.copyWith(chosenCategory: category));
  }

  void amountOnChange(String amount) {
    emit(state.copyWith(amount: amount));
  }

  int amountInt() {
    try {
      final amountInt = int.parse(state.amount);
      return amountInt;
    } catch (_) {
      return 10;
    }
  }
}
