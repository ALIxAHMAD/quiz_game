import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/features/trivia/data/datasources/remote/dio/data_source.dart';
import 'package:quiz_game/features/trivia/data/repositories/trivia_repository_impl.dart';
import 'package:quiz_game/features/trivia/domain/repositories/trivia_repository.dart';
import 'package:quiz_game/core/router/app_router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final dio = Dio();
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TriviaRepository>(
          create: (context) {
            return TriviaRepositoryImpl(
                remoteDataSource: DioDataSource(client: dio));
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
