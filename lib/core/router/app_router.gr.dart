// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/trivia/presentation/pages/home/home.dart' as _i1;
import '../../features/trivia/presentation/pages/questions/questions.dart'
    as _i2;
import '../../features/trivia/presentation/pages/score/score.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuestionsRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionsRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.QuestionsPage(
          key: args.key,
          categoryId: args.categoryId,
          amount: args.amount,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.ScorePage(
          key: args.key,
          score: args.score,
          fullScore: args.fullScore,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          QuestionsRoute.name,
          path: '/questions-page',
        ),
        _i4.RouteConfig(
          ScoreRoute.name,
          path: '/score-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.QuestionsPage]
class QuestionsRoute extends _i4.PageRouteInfo<QuestionsRouteArgs> {
  QuestionsRoute({
    _i5.Key? key,
    required int categoryId,
    required int amount,
  }) : super(
          QuestionsRoute.name,
          path: '/questions-page',
          args: QuestionsRouteArgs(
            key: key,
            categoryId: categoryId,
            amount: amount,
          ),
        );

  static const String name = 'QuestionsRoute';
}

class QuestionsRouteArgs {
  const QuestionsRouteArgs({
    this.key,
    required this.categoryId,
    required this.amount,
  });

  final _i5.Key? key;

  final int categoryId;

  final int amount;

  @override
  String toString() {
    return 'QuestionsRouteArgs{key: $key, categoryId: $categoryId, amount: $amount}';
  }
}

/// generated route for
/// [_i3.ScorePage]
class ScoreRoute extends _i4.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({
    _i5.Key? key,
    required int score,
    required int fullScore,
  }) : super(
          ScoreRoute.name,
          path: '/score-page',
          args: ScoreRouteArgs(
            key: key,
            score: score,
            fullScore: fullScore,
          ),
        );

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({
    this.key,
    required this.score,
    required this.fullScore,
  });

  final _i5.Key? key;

  final int score;

  final int fullScore;

  @override
  String toString() {
    return 'ScoreRouteArgs{key: $key, score: $score, fullScore: $fullScore}';
  }
}
