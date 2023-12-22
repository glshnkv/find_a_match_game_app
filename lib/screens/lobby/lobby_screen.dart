import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/screens/lobby/widgets/level_card_widget.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/widgets/scores/scores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  CarouselController _carouselController = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ScoresWidget(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.5,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  carouselController: _carouselController,
                  items: [
                    LevelCardWidget(title: 'Simple level'),
                    LevelCardWidget(title: 'Middle level'),
                    LevelCardWidget(title: 'Hard level'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _current == 0
                    ? SizedBox(
                        width: 40,
                      )
                    : GestureDetector(
                        onTap: () {
                          _carouselController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: SvgPicture.asset(
                          'assets/images/lobby/previous-button.svg',
                          width: 40,
                        ),
                      ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (_current == 0) {
                      // context.router.push();
                    } else if (_current == 1 || _current == 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(
                            'No access',
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
                        'assets/images/lobby/start-button.svg',
                        width: 315,
                      ),
                      Text(
                        'Start',
                        style:
                            TextStyle(color: AppColors.darkblue, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                _current == 2
                    ? SizedBox(
                        width: 40,
                      )
                    : GestureDetector(
                        onTap: () {
                          _carouselController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: SvgPicture.asset(
                          'assets/images/lobby/next-button.svg',
                          width: 40,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
