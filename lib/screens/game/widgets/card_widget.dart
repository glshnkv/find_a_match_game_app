import 'dart:async';

import 'package:find_a_match_game_app/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardModel card;
  final int index;
  final ValueChanged<int> onCardPressed;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _handleCardTap() {
    if (widget.card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 100), () {
        widget.onCardPressed(widget.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleCardTap,
      child: Center(
          child: widget.card.state == CardState.hidden
              ? SvgPicture.asset(
                  'assets/images/game/hidden-card.svg',
                  width: 115,
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/game/visible-card.svg',
                      width: 115,
                    ),
                    Image.asset(
                      widget.card.image,
                      width: 40,
                    )
                  ],
                )),
    );
  }
}
