import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/models/level_model.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:find_a_match_game_app/widgets/scores/scores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class WinScreen extends StatefulWidget {
  final LevelModel level;

  const WinScreen({super.key, required this.level});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<ScoresBloc>().add(AddCoinsEvent(coins: 100));
                                  context.router.push(SettingsRoute());
                                },
                                child: SvgPicture.asset(
                                  'assets/images/elements/settings-button.svg',
                                  width: 65,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<ScoresBloc>().add(AddCoinsEvent(coins: 100));
                                  context.router.popAndPush(LobbyRoute());
                                },
                                child: SvgPicture.asset(
                                  'assets/images/elements/home-button.svg',
                                  width: 65,
                                ),
                              ),
                            ],
                          ),
                          ScoresWidget(),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 245,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/images/elements/header.svg'),
                        Text(
                          'Level ${widget.level.number} is over',
                          style: TextStyle(
                              color: AppColors.darkblue,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/elements/small-bg.svg',
                        width: 360,
                      ),
                      Text(
                        '+ 100 coins',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<ScoresBloc>().add(AddCoinsEvent(coins: 100));
                      context.router.popAndPush(LevelsRoute());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/lobby/start-button.svg',
                          width: 315,
                        ),
                        Text(
                          'OK',
                          style:
                              TextStyle(color: AppColors.darkblue, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child:
                  SvgPicture.asset('assets/images/elements/tree-element.svg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.flip(
              flipX: true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: SvgPicture.asset(
                  'assets/images/elements/tree-element.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
