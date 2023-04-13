import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_game/core/constants/constants.dart';
import 'package:quiz_game/core/router/app_router.gr.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';
import 'package:quiz_game/features/trivia/presentation/cubit/home/home_cubit.dart';
import 'package:quiz_game/features/trivia/presentation/pages/home/components/choseCategoryDialog.dart';
import 'package:quiz_game/features/trivia/presentation/pages/home/components/chose_difficulty_dialog.dart';

import '../../../../../core/util/widgets/error_screen.dart';
import '../../../../../core/util/widgets/loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = HomeCubit(
      repository: RepositoryProvider.of<TriviaRepository>(context),
    );
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              "assets/page/pg.svg",
              fit: BoxFit.fill,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: cubit,
              builder: (context, state) {
                if (state.isLoading) {
                  return const LoadingScreen();
                }
                if (state.errorMessage.isNotEmpty) {
                  return ErrorScreen(
                    errorMessage: "Something went wrong, please try again",
                    errorCallback: cubit.init,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      const Text(
                        "Let's start a new challenge",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.greenAccent.withOpacity(0.8),
                          onPrimary: kWhiteColor,
                          elevation: 8,
                          shadowColor: Colors.greenAccent.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              Widget dialog = const ChoseCategoryDialog();
                              return BlocProvider<HomeCubit>.value(
                                value: cubit,
                                child: dialog,
                              );
                            },
                          );
                        },
                        child: const Text("Categories"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.greenAccent.withOpacity(0.8),
                          onPrimary: kWhiteColor,
                          elevation: 8,
                          shadowColor: Colors.greenAccent.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              Widget dialog = const ChoseDifficultyDialog();
                              return BlocProvider<HomeCubit>.value(
                                value: cubit,
                                child: dialog,
                              );
                            },
                          );
                        },
                        child: const Text("Difficulty"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: cubit.amountOnChange,
                        decoration: const InputDecoration(
                          labelText: "Amount",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        state.chosenCategory.name == "empty"
                            ? "Please select a category"
                            : "Chosen category: ${state.chosenCategory.name}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: kWhiteColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.greenAccent.withOpacity(0.8),
                          onPrimary: kWhiteColor,
                          elevation: 8,
                          shadowColor: Colors.greenAccent.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {
                          if (state.chosenCategory.name == "empty") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(milliseconds: 1300),
                                behavior: SnackBarBehavior.floating,
                                content: Text("Please select a category"),
                              ),
                            );
                          } else {
                            AutoRouter.of(context).replaceAll([
                              QuestionsRoute(
                                categoryId: state.chosenCategory.id,
                                amount: cubit.amountInt(),
                                difficulty: state.difficulty,
                              ),
                            ]);
                          }
                        },
                        child: const Text("Start"),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
