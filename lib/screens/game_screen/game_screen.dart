import 'package:connect_four/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/game_body.dart';

class GameScreen extends StatelessWidget {
  final GameController gameController=Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=>Text(gameController.turnYellow?'Player Yellow':'Player Red',
        style: TextStyle(
          color: gameController.turnYellow?Colors.yellow:Colors.red
        ),)),
      ),
      body: GameBody()
    );
  }
}
