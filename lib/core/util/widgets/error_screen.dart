// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/router/app_router.gr.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.errorMessage,
    required this.errorCallback,
  }) : super(key: key);
  final String errorMessage;
  final VoidCallback errorCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/page/pg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Ops!",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: kSecondaryColor),
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  errorCallback();
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
                      "Ok",
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
