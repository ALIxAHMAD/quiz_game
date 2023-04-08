// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_game/core/router/app_router.gr.dart';

import '../../../../../core/constants/constants.dart';
import '../../../domain/repositories/trivia_repository.dart';
import '../../cubit/questions/questions_cubit.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import 'components/question_card.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({
    Key? key,
    required this.categoryId,
    required this.amount,
  }) : super(key: key);
  final int categoryId;
  final int amount;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late final QuestionsCubit cubit;

  _QuestionsPageState();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = QuestionsCubit(
      repository: RepositoryProvider.of<TriviaRepository>(context),
    );
    cubit.init(widget.categoryId, widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<QuestionsCubit, QuestionsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return LoadingScreen();
              }
              if (state.errorMessage != "") {
                return ErrorScreen(
                    errorMessage: "Something went wrong",
                    errorCallback: () {
                      AutoRouter.of(context).replaceAll([HomeRoute()]);
                    });
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Question xx/xx
                      Text(
                        "Question ${state.currentQuestionIndex + 1}/${state.questions.questions.length}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      // Question card
                      QuestionCard(
                        question: state.currentQuestion,
                      ),
                      // Next question or finish
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: OutlinedButton(
                              onPressed: () {
                                state.isFinished
                                    ? AutoRouter.of(context).replaceAll([
                                        ScoreRoute(
                                            score: state.score,
                                            fullScore: state.fullScore)
                                      ])
                                    : cubit.nextQuestion();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.isFinished ? "Finish" : "Next",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .primaryColorLight),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: Theme.of(context).primaryColorLight,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
