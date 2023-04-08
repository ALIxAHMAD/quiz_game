import 'package:auto_route/auto_route.dart';
import 'package:quiz_game/features/trivia/presentation/pages/home/home.dart';
import 'package:quiz_game/features/trivia/presentation/pages/questions/questions.dart';
import 'package:quiz_game/features/trivia/presentation/pages/score/score.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Screen,Route',
    routes: <AutoRoute>[
      CustomRoute(
        page: HomePage,
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: QuestionsPage,
        transitionsBuilder: TransitionsBuilders.noTransition,
      ),
      CustomRoute(
        page: ScorePage,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      )
    ])
class $AppRouter {}
