import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      context.router.push(const OnboardingRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                'Find a Match'.toUpperCase(),
                style: TextStyle(color: AppColors.white, fontSize: 24),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  lineHeight: 4.0,
                  percent: 1.0,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.13),
                  progressColor: AppColors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
