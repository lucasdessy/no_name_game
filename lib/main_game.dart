import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

import 'components/fly.dart';

class MainGame extends Game {
  Size screenSize;
  List<Fly> flies;
  double tileSize;
  Random rnd;

  MainGame() {
    initialize();
  }

  void initialize() async {
    flies = <Fly>[];
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    final bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    final bgPaint = Paint()..color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }

  void spawnFly() {
    final x = rnd.nextDouble() * (screenSize.width - tileSize);
    final y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
  }
}
