import 'package:connect_four/screens/game_screen/widgets/cell.dart';
import 'package:flutter/material.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Cell(),
        Cell(),
        Cell(),
        Cell(),
        Cell(),
        Cell()
      ],
    );
  }
}