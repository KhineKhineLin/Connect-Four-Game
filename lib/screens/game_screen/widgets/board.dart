import 'package:connect_four/screens/game_screen/widgets/board_column.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 20,
          horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3)
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoardColumn(),
                  BoardColumn(),
                  BoardColumn(),
                  BoardColumn(),
                  BoardColumn(),
                  BoardColumn(),
                  BoardColumn()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}