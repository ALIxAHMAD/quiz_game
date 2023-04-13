// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:flutter/material.dart';
import 'package:quiz_game/core/constants/constants.dart';
import 'package:quiz_game/features/trivia/presentation/pages/questions/components/answer.dart';

import '../../../../domain/entities/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.questionText,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                question.answers.length,
                (index) => Answer(
                  text: question.answers[index],
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
