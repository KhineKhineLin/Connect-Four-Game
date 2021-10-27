import 'package:connect_four/screens/game_screen/widgets/cell.dart';
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
      // int resultHorizontal=checkHorizontals();
      // int resultVertical=checkVerticals();
      // if(resultHorizontal==1||resultVertical==1){
      //   Get.defaultDialog(
      //     title: 'YELLOW WON',
      //     content: Cell(currentCellMode: cellMode.YELLOW)
      //   ).then((value) => _buildBoard());
      // }else if(resultHorizontal==2||resultVertical==2){
      //   Get.defaultDialog(
      //     title: 'RED WON',
      //     content: Cell(currentCellMode: cellMode.RED)
      //   ).then((value) => _buildBoard());
      // }
      winner=checkVictory();
      if(winner!=0){
        declareWinner();
      }
      if(boardIsFull()){
        Get.defaultDialog(
          title: 'Draw! Nobody won.',
          content: Cell(currentCellMode: cellMode.EMPTY,
          )
        ).then((value) => resetGame());
      }
    }else{
      Get.snackbar('Not available', 'This column is already filled up. Choose another column.',
      snackPosition: SnackPosition.BOTTOM);
    }
  }
  int winner=0;
  void declareWinner(){
    Get.defaultDialog(
      title: winner==1?'YELLOW WON':'RED WON',
      content: Cell(currentCellMode: winner==1?cellMode.YELLOW:cellMode.RED)
    ).then((value) => resetGame());
  }
  void resetGame()=>_buildBoard();
  bool boardIsFull(){
    for(final col in board){
      for(final val in col){
        if(val==0){
          return false;
        }
      }
    }
    return true;
  }
  int checkHorizontals(){
    int yellowInARow=0;
    int redInARow=0;
    List<List<int>>rows=[];
    for(var i=0;i<0;i++){
      final List<int>currentRow=getRowList(i);
      rows.add(currentRow);
    }
    for(final row in rows){
      for(final cell in row){
        if(yellowInARow>=4){
          return 1;
        }else if(redInARow>=4){
          return 2;
        }else{
          if(cell==1){
            yellowInARow++;
            redInARow=0;
          }else if(cell==2){
            redInARow++;
            yellowInARow=0;
          }else{
            yellowInARow=0;
            redInARow=0;
          }
        }
      }
    }
    return 0;
  }
  List<int>getRowList(int rowNumber){
    List<int>rowList=[];
    for(final column in board){
      rowList.add(column[rowNumber]);
    }
    return rowList;
  }
  int checkVerticals(){
    int yellowInARow=0;
    int redInARow=0;
    for(final column in board){
      for(final cell in column){
        if(yellowInARow>=4){
          return 1;
        }else if(redInARow>=4){
          return 2;
        }else{
          if(cell==1){
            yellowInARow++;
            redInARow=0;
          }else if(cell==2){
            redInARow++;
            yellowInARow=0;
          }else{
            yellowInARow=0;
            redInARow=0;
          }
        }
      }
    }
    return 0;
  }
  int checkDiagonal(){
    final List<int>diagonalDown1=[];
    final List<int>diagonalDown2=[];
    final List<int>diagonalDown3=[];
    final List<int>diagonalDown4=[];
    final List<int>diagonalDown5=[];
    final List<int>diagonalDown6=[];
    final List<int>diagonalup1=[];
    final List<int>diagonalup2=[];
    final List<int>diagonalup3=[];
    final List<int>diagonalup4=[];
    final List<int>diagonalup5=[];
    final List<int>diagonalup6=[];

    diagonalDown1.add(getCellValue(0, 3));
    diagonalDown1.add(getCellValue(1, 2));
    diagonalDown1.add(getCellValue(2, 1));
    diagonalDown1.add(getCellValue(3, 0));

    diagonalDown2.add(getCellValue(0, 4));
    diagonalDown2.add(getCellValue(1, 3));
    diagonalDown2.add(getCellValue(2, 2));
    diagonalDown2.add(getCellValue(3, 1));
    diagonalDown2.add(getCellValue(4, 0));

    diagonalDown3.add(getCellValue(0, 5));
    diagonalDown3.add(getCellValue(1, 4));
    diagonalDown3.add(getCellValue(2, 3));
    diagonalDown3.add(getCellValue(3, 2));
    diagonalDown3.add(getCellValue(4, 1));
    diagonalDown3.add(getCellValue(5, 0));

    diagonalDown4.add(getCellValue(1, 5));
    diagonalDown4.add(getCellValue(2, 4));
    diagonalDown4.add(getCellValue(3, 3));
    diagonalDown4.add(getCellValue(4, 2));
    diagonalDown4.add(getCellValue(5, 1));
    diagonalDown4.add(getCellValue(6, 0));

    diagonalDown5.add(getCellValue(2, 5));
    diagonalDown5.add(getCellValue(3, 4));
    diagonalDown5.add(getCellValue(4, 3));
    diagonalDown5.add(getCellValue(5, 2));

    diagonalDown6.add(getCellValue(3, 5));
    diagonalDown6.add(getCellValue(4, 4));
    diagonalDown6.add(getCellValue(5, 3));
    diagonalDown6.add(getCellValue(6, 2));

    diagonalup1.add(getCellValue(0, 2));
    diagonalup1.add(getCellValue(1, 2));
    diagonalup1.add(getCellValue(2, 3));
    diagonalup1.add(getCellValue(3, 4));

    diagonalup2.add(getCellValue(0, 1));
    diagonalup2.add(getCellValue(1, 2));
    diagonalup2.add(getCellValue(2, 3));
    diagonalup2.add(getCellValue(3, 4));
    diagonalup2.add(getCellValue(4, 5));

    diagonalup3.add(getCellValue(0, 0));
    diagonalup3.add(getCellValue(1, 1));
    diagonalup3.add(getCellValue(2, 2));
    diagonalup3.add(getCellValue(3, 3));
    diagonalup3.add(getCellValue(4, 4));
    diagonalup3.add(getCellValue(5, 5));

    diagonalup4.add(getCellValue(1, 0));
    diagonalup4.add(getCellValue(2, 1));
    diagonalup4.add(getCellValue(3, 2));
    diagonalup4.add(getCellValue(4, 3));
    diagonalup4.add(getCellValue(5, 4));
    diagonalup4.add(getCellValue(6, 5));

    diagonalup5.add(getCellValue(2, 0));
    diagonalup5.add(getCellValue(3, 1));
    diagonalup5.add(getCellValue(4, 2));
    diagonalup5.add(getCellValue(5, 3));
    diagonalup5.add(getCellValue(6, 4));

    diagonalup6.add(getCellValue(3, 0));
    diagonalup6.add(getCellValue(4, 1));
    diagonalup6.add(getCellValue(5, 2));
    diagonalup6.add(getCellValue(6, 3));

    List<List<int>>diagonals=[];
    diagonals.addAll([diagonalDown1,
    diagonalDown2,
    diagonalDown3,
    diagonalDown4,
    diagonalDown5,
    diagonalDown6,
    diagonalup1,
    diagonalup2,
    diagonalup3,
    diagonalup4,
    diagonalup5,
    diagonalup6]);
    for(final diagonal in diagonals){
      final String diagonalStr=diagonal.join();
      if(diagonalStr.contains('1111')){
        return 1;
      }else if(diagonalStr.contains('2222')){
        return 2;
      }
    }
    return 0;
  }
  int getCellValue(int columnNumber,int rowNumber){
    return board[columnNumber][rowNumber];
  }
  int checkVictory(){
    const int maxx=7;
    const int maxy=6;
    List<List<int>>directions=[
      [1,0],[1,-1],[1,1],[0,1]
    ];
    for(List<int>d in directions){
      int dx=d[0];
      int dy=d[1];
      for(int x=0;x<maxx;x++){
        for(int y=0;y<maxy;y++){
          int lastx=(x+(3*dx));
          int lasty=(y+(3*dy));
          if((((0<=lastx)&&(lastx<maxx))&&(0<=lasty))&&(lasty<maxy)){
            int w=board[x][y];
            if((((w!=0)&&(w==board[x+dx][y+dy]))&&(w==board[x+(2*dx)][y+(2*dy)]))&&(w==board[lastx][lasty])){
              return w;
            }
          }
        }
      }
    }
    return 0;
  }
}