import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/page/pg.svg", fit: BoxFit.fill),
          const Center(
            child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
