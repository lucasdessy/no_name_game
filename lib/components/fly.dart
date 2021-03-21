import 'package:flutter/material.dart';
import 'package:no_name_game/main_game.dart';

class Fly {
  final MainGame game;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint()..color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {}
  void onTapDown() {}
}
