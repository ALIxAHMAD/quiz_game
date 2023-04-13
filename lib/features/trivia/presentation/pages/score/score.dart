// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import 'package:quiz_game/core/router/app_router.gr.dart';

import '../../../../../core/constants/constants.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key? key,
    required this.score,
    required this.fullScore,
  }) : super(key: key);
  final int score;
  final int fullScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/page/pg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${score}/${fullScore}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              OutlinedButton(
                onPressed: () {
                  AutoRouter.of(context).replaceAll(
                    [const HomeRoute()],
                  );
                },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Home",
                      style: TextStyle(color: kWhiteColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: kWhiteColor,
                    )
                  ],
                ),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
