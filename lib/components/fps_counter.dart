import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:no_name_game/main_game.dart';

class FpsCounter extends Component {
  final MainGame game;
  static final _fpsOffset = Offset(0, 0);
  late TextSpan _fpsSpan;
  late TextPainter _fpsPainter;
  FpsCounter(this.game) {
    _fpsSpan = TextSpan(text: 'Fps', style: TextStyle(color: Colors.black));
    _fpsPainter = TextPainter(
        text: _fpsSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
  }

  @override
  void render(Canvas c) {
    _fpsPainter.layout();
    _fpsPainter.paint(c, _fpsOffset);
  }

  @override
  void update(double dt) {
    _fpsSpan = TextSpan(
        text: '${game.fps().toStringAsFixed(2)} Fps',
        style: TextStyle(color: Colors.black));
    _fpsPainter = TextPainter(
        text: _fpsSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    super.update(dt);
  }
}
