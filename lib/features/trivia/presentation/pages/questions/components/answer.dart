import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/constants/constants.dart';
import 'package:quiz_game/features/trivia/presentation/cubit/questions/questions_cubit.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<QuestionsCubit>(context);
    final state = cubit.state;

    Color getTheRightColor() {
      if (state.isAnswered) {
        final isCorrectAnswer =
            index == state.currentQuestion.correctAnswerIndex;
        final isSelectedAnswer = index == state.selectedAnswer;
        final isIncorrectAnswer = isSelectedAnswer && !isCorrectAnswer;

        if (isCorrectAnswer) return kGreenColor;
        if (isIncorrectAnswer) return kRedColor;
      }

      return kGrayColor;
    }

    IconData getTheRightIcon() =>
        getTheRightColor() == kRedColor ? Icons.close : Icons.done;

    return InkWell(
      onTap: state.isAnswered ? null : () => cubit.answerQuestion(index),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: getTheRightColor()),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${index + 1}. $text",
                style: TextStyle(color: getTheRightColor(), fontSize: 16),
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: getTheRightColor() == kGrayColor
                    ? Colors.transparent
                    : getTheRightColor(),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor()),
              ),
              child: getTheRightColor() == kGrayColor
                  ? null
                  : Icon(getTheRightIcon(), size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
