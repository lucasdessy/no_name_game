import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_name_game/main_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  final mainGame = MainGame();
  runApp(mainGame.widget);
  final tapper = TapGestureRecognizer();
  tapper.onTapDown = mainGame.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
