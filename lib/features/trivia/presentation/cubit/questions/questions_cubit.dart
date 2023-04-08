import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';
import 'package:quiz_game/features/trivia/domain/entities/question.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';
import 'package:quiz_game/features/trivia/domain/usecases/get_questions.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetQuestions getQuestions;
  QuestionsCubit({required TriviaRepository repository})
      : getQuestions = GetQuestions(repository),
        super(QuestionsState.init());

  void init(int id, int amount) async {
    emit(state.copyWith(isLoading: true));
    final result = await getQuestions(amount, QuestionDifficulty.medium, id);
    result.fold((l) {
      emit(state.copyWith(errorMessage: l.message, isLoading: false));
    }, (r) {
      emit(
        state.copyWith(
          questions: r,
          isLoading: false,
          currentQuestion: r.questions[state.currentQuestionIndex],
          fullScore: r.questions.length * 10,
        ),
      );
    });
  }

  void answerQuestion(index) {
    emit(state.copyWith(questionAnswerIndex: index));
    if (index == state.currentQuestion.correctAnswerIndex) {
      emit(state.copyWith(isAnswered: true, score: state.score + 10));
      return;
    }
    emit(state.copyWith(isAnswered: true));
  }

  void nextQuestion() {
    if (!state.isAnswered) {
      return;
    }
    emit(
      state.copyWith(
        currentQuestion:
            state.questions.questions[state.currentQuestionIndex + 1],
        currentQuestionIndex: state.currentQuestionIndex + 1,
        isAnswered: false,
      ),
    );
    if (state.currentQuestionIndex == state.questions.questions.length - 1) {
      emit(state.copyWith(isFinished: true));
    }
  }
}
