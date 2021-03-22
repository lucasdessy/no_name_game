import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:no_name_game/main_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GameWidget(
      game: MainGame(),
    ),
  );
}
