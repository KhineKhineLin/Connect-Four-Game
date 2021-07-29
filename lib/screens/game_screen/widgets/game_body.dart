import 'package:connect_four/screens/game_screen/widgets/board.dart';
import 'package:connect_four/screens/game_screen/widgets/board_column.dart';
import 'package:flutter/material.dart';

import 'cell.dart';

class GameBody extends StatelessWidget {
  const GameBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Board();
  }
}