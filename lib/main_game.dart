import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:no_name_game/components/bg.dart';
import 'package:no_name_game/components/fly.dart';
import 'package:no_name_game/components/fps_counter.dart';

class MainGame extends BaseGame with TapDetector {
  late List<Fly> flies;
  final rng = Random();
  @override
  Future<void> onLoad() {
    flies = List.generate(
      5,
      (index) => Fly(
        this,
        (rng.nextInt(size.x.toInt()).toDouble() - 50).clamp(0, size.x),
        (rng.nextInt(size.y.toInt()).toDouble() - 50).clamp(0, size.y),
      ),
    );
    add(Bg(this));
    flies.forEach((element) => add(element));
    add(FpsCounter(this));
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownDetails details) {
    flies.forEach((element) {
      if (element.flyRect.contains(details.globalPosition)) {
        element.onTapDown();
      }
    });
  }

  @override
  void update(double dt) {
    final fliesToBeRemoved = <Fly>[];
    for (final fly in flies) {
      if (fly.isOffScreen) {
        fliesToBeRemoved.add(fly);
      }
    }
    for (var fly in fliesToBeRemoved) {
      remove(fly);
      flies.removeWhere((element) => element == fly);
      final newFly = Fly(
        this,
        (rng.nextInt(size.x.toInt()).toDouble() - 50).clamp(0, size.x),
        (rng.nextInt(size.y.toInt()).toDouble() - 50).clamp(0, size.y),
      );
      flies.add(newFly);
      add(newFly);
    }
    super.update(dt);
  }
}
