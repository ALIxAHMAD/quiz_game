// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Categories categories;
  final Category chosenCategory;
  final String errorMessage;
  final String amount;
  final bool isLoading;
  final QuestionDifficulty difficulty;
  const HomeState({
    required this.categories,
    required this.chosenCategory,
    required this.errorMessage,
    required this.amount,
    required this.isLoading,
    required this.difficulty,
  });
  @override
  List<Object?> get props =>
      [categories, chosenCategory, errorMessage, amount, difficulty];

  factory HomeState.init() {
    return const HomeState(
        categories: Categories(categories: []),
        chosenCategory: Category(id: 10, name: "empty"),
        errorMessage: "",
        amount: "",
        isLoading: false,
        difficulty: QuestionDifficulty.medium);
  }

  HomeState copyWith({
    Categories? categories,
    Category? chosenCategory,
    String? errorMessage,
    String? amount,
    bool? isLoading,
    QuestionDifficulty? difficulty,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      chosenCategory: chosenCategory ?? this.chosenCategory,
      errorMessage: errorMessage ?? this.errorMessage,
      amount: amount ?? this.amount,
      isLoading: isLoading ?? this.isLoading,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
