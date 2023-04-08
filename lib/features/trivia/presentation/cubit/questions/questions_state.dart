// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'questions_cubit.dart';

class QuestionsState extends Equatable {
  final String errorMessage;
  final int score;
  final int currentQuestionIndex;
  final Questions questions;
  final bool isLoading;
  final Question currentQuestion;
  final bool isFinished;
  final bool isAnswered;
  final int selectedAnswer;
  final int fullScore;
  const QuestionsState({
    required this.errorMessage,
    required this.score,
    required this.currentQuestionIndex,
    required this.questions,
    required this.isLoading,
    required this.currentQuestion,
    required this.isFinished,
    required this.isAnswered,
    required this.selectedAnswer,
    required this.fullScore,
  });

  @override
  List<Object> get props => [
        questions,
        score,
        errorMessage,
        isLoading,
        isAnswered,
        isFinished,
        selectedAnswer,
        currentQuestion,
        currentQuestionIndex,
      ];

  factory QuestionsState.init() {
    return const QuestionsState(
      questions: Questions(questions: []),
      score: 0,
      errorMessage: "",
      isLoading: false,
      currentQuestion:
          Question(questionText: "", answers: [], correctAnswerIndex: 0),
      currentQuestionIndex: 0,
      isFinished: false,
      isAnswered: false,
      selectedAnswer: 0,
      fullScore: 0,
    );
  }

  QuestionsState copyWith({
    String? errorMessage,
    int? score,
    int? currentQuestionIndex,
    Questions? questions,
    bool? isLoading,
    Question? currentQuestion,
    bool? isFinished,
    bool? isAnswered,
    int? questionAnswerIndex,
    int? fullScore,
  }) {
    return QuestionsState(
      errorMessage: errorMessage ?? this.errorMessage,
      score: score ?? this.score,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      isFinished: isFinished ?? this.isFinished,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedAnswer: questionAnswerIndex ?? this.selectedAnswer,
      fullScore: fullScore ?? this.fullScore,
    );
  }
}
