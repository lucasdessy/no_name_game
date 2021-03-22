import 'package:flame/components.dart';

import 'package:flutter/rendering.dart';
import 'package:no_name_game/main_game.dart';

class Bg extends Component {
  final _paint = Paint()..color = Color(0xff7fdbe0);
  late Rect _bgRect;
  final MainGame game;
  double time = 0;
  Bg(this.game) {
    _bgRect = Rect.fromLTWH(0, 0, game.size.x, game.size.y);
  }
  @override
  void render(Canvas c) {
    c.drawRect(_bgRect, _paint);
    super.render(c);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    _bgRect = Rect.fromLTWH(0, 0, gameSize.x, gameSize.y);
    super.onGameResize(gameSize);
  }
}
