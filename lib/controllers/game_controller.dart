import 'package:get/get.dart';

class GameController extends GetxController{
  RxList<List<int>>_board=RxList<List<int>>();
  List<List<int>>get board=>_board.value;
  set board(List<List<int>>value)=>_board.value=value;
  void _buildBoard(){
    board=[
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0)
    ];
  }
  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }
}