import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelCardWidget extends StatelessWidget {
  final String title;

  const LevelCardWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/lobby/card.svg',
          width: 400,
        ),
        Text(
          title,
          style:
          TextStyle(color: AppColors.white, fontSize: 36),
        ),
      ],
    );
  }
}
