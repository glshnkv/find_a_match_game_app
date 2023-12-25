import 'dart:async';

import 'package:find_a_match_game_app/repository/coins_repository.dart';
import 'package:find_a_match_game_app/repository/hearts_repository.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoresWidget extends StatefulWidget {
  const ScoresWidget({super.key});

  @override
  State<ScoresWidget> createState() => _ScoresWidgetState();
}

class _ScoresWidgetState extends State<ScoresWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ScoresBloc(GetIt.I<HeartsRepository>(), GetIt.I<CoinsRepository>())
        ..add(GetScoresEvent()),
      child: BlocConsumer<ScoresBloc, ScoresState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is UpdateScoresState) {
            final _coins = state.coins;
            final _hearts = state.hearts;
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
                        '${_hearts}',
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
                        '${_coins}',
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
          return Container();
        },
      ),
    );
  }
}
