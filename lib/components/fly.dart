import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../main_game.dart';

class Fly extends Component {
  late Rect flyRect;
  late Paint _flyPaint;
  final MainGame game;
  double x;
  double y;
  double speedY = 0.0;

  bool isDead = false;
  bool isOffScreen = false;

  double timePassed = 0.0;
  Fly(this.game, this.x, this.y) {
    flyRect = Rect.fromLTWH(x, y, 50, 50);
    _flyPaint = Paint()..color = Color(0xFFaaff12);
  }

  @override
  void render(Canvas c) {
    c.drawRect(flyRect, _flyPaint);
  }

  @override
  void update(double dt) {
    if (flyRect.top > game.size.y) {
      isOffScreen = true;
      print('fly is offscreen');
    }
    if (isDead) {
      timePassed += dt;
      x += (sin(timePassed * (speedY * 0.015)) * 2);
      flyRect = Rect.fromLTWH(x, y, 50, 50);
      y += speedY * dt - 800 * dt * dt / 2;
      speedY += 800 * dt;
    }

    super.update(dt);
  }

  void onTapDown() {
    _flyPaint.color = Color(0xFFFF0012);
    isDead = true;
  }
}
