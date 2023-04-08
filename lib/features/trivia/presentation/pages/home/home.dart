import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/constants/constants.dart';
import 'package:quiz_game/core/router/app_router.gr.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';
import 'package:quiz_game/features/trivia/presentation/cubit/home/home_cubit.dart';
import 'package:quiz_game/features/trivia/presentation/pages/home/components/choseCategoryDialog.dart';

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
        appBar: AppBar(
          title: const Text("Quiz Game"),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingScreen();
            }
            if (state.errorMessage != "") {
              return ErrorScreen(
                errorMessage: "Something went wrong try again",
                errorCallback: () {
                  cubit.init();
                },
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Start a new challenge",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColorLight),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            Widget dialog = const ChoseCategoryDialog();

                            return BlocProvider<HomeCubit>.value(
                              value: cubit, //
                              child: dialog,
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Flexible(child: Text("categories")),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: cubit.amountOnChange,
                    decoration: const InputDecoration(
                      hintText: "amount",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    "current category: ${state.chosenCategory.name}",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: OutlinedButton(
                        onPressed: () {
                          state.chosenCategory.name == "empty"
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Please select a category"),
                                  ),
                                )
                              : AutoRouter.of(context).replaceAll(
                                  [
                                    QuestionsRoute(
                                      categoryId: state.chosenCategory.id,
                                      amount: cubit.amountInt(),
                                    )
                                  ],
                                );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Start",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
