import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoresWidget extends StatefulWidget {
  const ScoresWidget({super.key});

  @override
  State<ScoresWidget> createState() => _ScoresWidgetState();
}

class _ScoresWidgetState extends State<ScoresWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(children: [
          Image.asset(
            'assets/images/scores/heart-icon.png',
            width: 35,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/scores/bg.svg',
                width: 55,
              ),
              Text(
                '1234',
                style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ]),
        SizedBox(width: 10),
        Row(children: [
          Image.asset(
            'assets/images/scores/coin-icon.png',
            width: 35,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/scores/bg.svg',
                width: 55,
              ),
              Text(
                '1234',
                style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
