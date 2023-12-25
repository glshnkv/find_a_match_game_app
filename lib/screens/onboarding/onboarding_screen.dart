import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Spacer(flex: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                              color: AppColors.darkblue,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.54, // 450.0
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis.',
                            style: TextStyle(
                              color: AppColors.darkblue,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(LobbyRoute());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/onboarding/start-button.svg',
                          width: 400,
                        ),
                        Text(
                          'Start',
                          style:
                              TextStyle(color: AppColors.darkblue, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.26,
              height: MediaQuery.of(context).size.height * 0.9,
              child:
                  SvgPicture.asset('assets/images/onboarding/tree-element.svg'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.flip(
              flipX: true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.26,
                height: MediaQuery.of(context).size.height * 0.9,
                child: SvgPicture.asset(
                  'assets/images/onboarding/tree-element.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
