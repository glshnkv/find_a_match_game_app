import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/models/level_model.dart';
import 'package:find_a_match_game_app/screens/game/game_screen.dart';
import 'package:find_a_match_game_app/screens/levels/levels_screen.dart';
import 'package:find_a_match_game_app/screens/loading/loading_screen.dart';
import 'package:find_a_match_game_app/screens/lobby/lobby_screen.dart';
import 'package:find_a_match_game_app/screens/onboarding/onboarding_screen.dart';
import 'package:find_a_match_game_app/screens/settings/settings_screen.dart';
import 'package:find_a_match_game_app/screens/win/win_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LobbyRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: LevelsRoute.page),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: WinRoute.page),

  ];
}