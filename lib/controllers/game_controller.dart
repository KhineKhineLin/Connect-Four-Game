import 'package:get/get.dart';

class GameController extends GetxController{
  RxList<List<int>>_board=RxList<List<int>>();
  List<List<int>>get board=>_board.value;
  set board(List<List<int>>value)=>_board.value=value;
  RxBool _turnYellow=true.obs;
  bool get turnYellow=>_turnYellow.value;
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
  void playColumn(int columnNumber){
    final int playerNumber=turnYellow?1:2;
    final selectedColumn=board[columnNumber];
    if(selectedColumn.contains(0)){
      final int rowIndex=selectedColumn.indexWhere((cell) => cell==0);
      selectedColumn[rowIndex]=playerNumber;
      _turnYellow.value=!_turnYellow.value;
      update();
    }else{
      Get.snackbar('Not available', 'This column is already filled up. Choose another column.',
      snackPosition: SnackPosition.BOTTOM);
    }
  }
}