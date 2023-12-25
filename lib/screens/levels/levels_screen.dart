import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/repository/levels_repository.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/screens/levels/bloc/level_bloc.dart';
import 'package:find_a_match_game_app/services/shared_preferences.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:find_a_match_game_app/widgets/scores/scores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.push(SettingsRoute());
                            },
                            child: SvgPicture.asset(
                              'assets/images/elements/settings-button.svg',
                              width: 65,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
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
              BlocProvider(
                create: (context) =>
                    LevelBloc(GetIt.I<LevelsRepository>())..add(GetLevelsEvent()),
                child: BlocConsumer<LevelBloc, LevelState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoadedLevelsState) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 80,
                            mainAxisSpacing: 10,
                            crossAxisCount: 5,
                          ),
                          itemCount: state.levels.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                SharedPreferencesService storage =
                                    await SharedPreferencesService.getInstance();
                                if (storage.hearts > 0) {
                                  context.read<ScoresBloc>().add(TakeHeartEvent());
                                  context.router.push(GameRoute(level: state.levels[index]));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.red,
                                      content: Text(
                                        'Oops... Not enough Diamonds. Try Later.',
                                        style: TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/game/level-button.svg',
                                    width: 85,
                                  ),
                                  Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                        color: state.levels[index].isDone
                                            ? AppColors.yellow
                                            : AppColors.white,
                                        fontSize: 28),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
