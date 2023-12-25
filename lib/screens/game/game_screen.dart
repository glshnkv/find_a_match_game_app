import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:find_a_match_game_app/models/card_model.dart';

// import 'package:find_a_match_game_app/models/game_model.dart';
import 'package:find_a_match_game_app/models/level_model.dart';
import 'package:find_a_match_game_app/router/router.dart';
import 'package:find_a_match_game_app/screens/game/widgets/card_widget.dart';
import 'package:find_a_match_game_app/theme/colors.dart';
import 'package:find_a_match_game_app/utils/card_images.dart';
import 'package:find_a_match_game_app/widgets/scores/scores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  final LevelModel level;

  const GameScreen({
    super.key,
    required this.level,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // late GameModel game;
  late Duration duration;

  @override
  void initState() {
    super.initState();
    // game = GameModel(gridSize: widget.level.gridSize);
    duration = const Duration();
    generateCards();
    generateImages();
  }

  List<CardModel> cards = [];
  bool isGameOver = false;
  Set<String> images = {};

  void generateCards() {
    generateImages();
    cards = [];
    final List<Color> cardColors = Colors.primaries.toList();
    for (int i = 0;
        i < (widget.level.gridSize);
        i++) {
      final cardValue = i + 1;
      final String image = images.elementAt(i);
      final Color cardColor = cardColors[i % cardColors.length];
      final List<CardModel> newCards =
          _createCardModels(image, cardValue);
      cards.addAll(newCards);
    }
    cards.shuffle(Random());
  }

  void generateImages() {
    images = <String>{};
    for (int j = 0;
        j < (widget.level.gridSize);
        j++) {
      final String image = _getRandomCardImage();
      images.add(image);
      images.add(image);
    }
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  void onCardPressed(int index) {
    setState(() {
      cards[index].state = CardState.visible;
    });
    final List<int> visibleCardIndexes = _getVisibleCardIndexes();
    if (visibleCardIndexes.length == 2) {
      final CardModel card1 = cards[visibleCardIndexes[0]];
      final CardModel card2 = cards[visibleCardIndexes[1]];
      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        isGameOver = _isGameOver();
        if (isGameOver) {
          Future.delayed(const Duration(seconds: 1), () {
            widget.level.isDone = true;
            context.router.push(WinRoute(level: widget.level));
          });
        }
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            card1.state = CardState.hidden;
            card2.state = CardState.hidden;
          });
        });
      }
    }
  }

  List<CardModel> _createCardModels(
      String image, int cardValue) {
    return List.generate(
      2,
      (index) => CardModel(
        value: cardValue,
        image: image,
      ),
    );
  }

  String _getRandomCardImage() {
    final Random random = Random();
    String image;
    do {
      image = cardImages[random.nextInt(cardImages.length)];
    } while (images.contains(image));
    return image;
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == CardState.guessed);
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

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
                        'assets/images/game/game-bg.svg',
                        width: 505,
                      ),
                      cards.length == 4 ?
                      Container(
                        width: 400,
                        height: 200,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                          children: List.generate(cards.length, (index) {
                            return CardWidget(
                              index: index,
                              card: cards[index],
                              onCardPressed: onCardPressed,
                            );
                          }),
                        ),
                      ) : Container(
                        width: 400,
                        height: 200,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          childAspectRatio: 2,
                          children: List.generate(cards.length, (index) {
                            return CardWidget(
                              index: index,
                              card: cards[index],
                              onCardPressed: onCardPressed,
                            );
                          }),
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
              alignment: Alignment(0,-0.7),
              child: SizedBox(
                width: 245,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/images/elements/header.svg'),
                    Text(
                      'Level ${widget.level.number}',
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
