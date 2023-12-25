import 'package:find_a_match_game_app/find_match_game_app.dart';
import 'package:find_a_match_game_app/repository/coins_repository.dart';
import 'package:find_a_match_game_app/repository/hearts_repository.dart';
import 'package:find_a_match_game_app/repository/levels_repository.dart';
import 'package:find_a_match_game_app/screens/levels/bloc/level_bloc.dart';
import 'package:find_a_match_game_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetIt.instance.registerSingleton(LevelsRepository());
  await GetIt.instance.registerSingleton(HeartsRepository());
  await GetIt.instance.registerSingleton(CoinsRepository());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LevelBloc>(
          create: (context) => LevelBloc(GetIt.I<LevelsRepository>())),
      BlocProvider<ScoresBloc>(
          create: (context) => ScoresBloc(
              GetIt.I<HeartsRepository>(), GetIt.I<CoinsRepository>())),
    ],
    child: FindMatchGameApp(),
  ));
}
