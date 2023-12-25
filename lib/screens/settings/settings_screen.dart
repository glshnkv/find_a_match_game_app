import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/widgets/scores/scores_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.popAndPush(LobbyRoute());
                            },
                            child: SvgPicture.asset(
                              'assets/images/elements/home-button.svg',
                              width: 65,
                            ),
                          ),
                          ScoresWidget(),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/elements/longer-card.svg',
                        width: 245,
                      ),
                      SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              child: Text(
                                'Privacy Policy'.toUpperCase(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              child: Text(
                                'Terms of use'.toUpperCase(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              child: Text(
                                'Rate App'.toUpperCase(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment(0, -0.8),
              child: SizedBox(
                width: 245,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/images/elements/header.svg'),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: AppColors.darkblue,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child:
                  SvgPicture.asset('assets/images/elements/tree-element.svg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.flip(
              flipX: true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
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
