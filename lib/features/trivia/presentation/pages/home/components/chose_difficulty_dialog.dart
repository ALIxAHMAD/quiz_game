import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/enums/question_difficulty.dart';

import '../../../cubit/home/home_cubit.dart';

class ChoseDifficultyDialog extends StatelessWidget {
  const ChoseDifficultyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                cubit.choseDifficulty(QuestionDifficulty.easy);
                Navigator.of(context).pop();
              },
              title: const Text("Easy"),
            ),
            ListTile(
              onTap: () {
                cubit.choseDifficulty(QuestionDifficulty.medium);
                Navigator.of(context).pop();
              },
              title: const Text("Medium"),
            ),
            ListTile(
              onTap: () {
                cubit.choseDifficulty(QuestionDifficulty.hard);
                Navigator.of(context).pop();
              },
              title: const Text("Hard"),
            )
          ],
        ),
      ),
    );
  }
}
