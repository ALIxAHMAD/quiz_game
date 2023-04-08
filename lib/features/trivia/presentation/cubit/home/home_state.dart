// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Categories categories;
  final Category chosenCategory;
  final String errorMessage;
  final int amount;
  final bool isLoading;
  const HomeState({
    required this.categories,
    required this.chosenCategory,
    required this.errorMessage,
    required this.amount,
    required this.isLoading,
  });
  @override
  List<Object?> get props => [categories, chosenCategory, errorMessage, amount];

  factory HomeState.init() {
    return const HomeState(
      categories: Categories(categories: []),
      chosenCategory: Category(id: 10, name: "empty"),
      errorMessage: "",
      amount: 1,
      isLoading: false,
    );
  }

  HomeState copyWith({
    Categories? categories,
    Category? chosenCategory,
    String? errorMessage,
    int? amount,
    bool? isLoading,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      chosenCategory: chosenCategory ?? this.chosenCategory,
      errorMessage: errorMessage ?? this.errorMessage,
      amount: amount ?? this.amount,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
