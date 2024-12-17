import 'dart:async';

import 'package:flutter/cupertino.dart';

class TurnProvider extends ChangeNotifier{
  List<String> _displayXO =['','','','','','','','',''];
  List<String> displayXO()=> _displayXO;
  Timer? timer;
  String _Winner = "no winner yet";
  int _Oscore = 0;
  int _Xscore = 0;
  int _filledBoxes = 0;
  bool haveWinner = false;
  static const  _maxSeconds = 30;
   int seconds  = _maxSeconds;
   int MaxSeconds()=>_maxSeconds;
  int OScore()=> _Oscore;
  int XScore()=> _Xscore;
  String Winner()=> _Winner;
  bool oTurn = true;
  void tapped(int index){
    final isRunning = timer == null? false : timer!.isActive;
    if(isRunning) {
      if (oTurn && _displayXO[index] == '') {
        _displayXO[index] = "O";
        _filledBoxes++;
      } else if (!oTurn && _displayXO[index] == '') {
        _displayXO[index] = "X";
        _filledBoxes++;
      }
    }
      oTurn =!oTurn;
      winner();
      notifyListeners();

  }
  void winner(){
    //check 1st row
    if(
    _displayXO[0] == _displayXO[1] &&
    _displayXO[0] == _displayXO[2] &&
    _displayXO[0] != ''
    ){
      _Winner = "Player " + _displayXO[0] + " wins!";
      _updateScore(_displayXO[0]);
      _stopTimer();
      notifyListeners();
    }

    //check 2nd row
    if(
    _displayXO[3] == _displayXO[4] &&
        _displayXO[3] == _displayXO[5] &&
        _displayXO[3] != ''
    ){
      _Winner = "Player " + _displayXO[3] + " wins!";
      _updateScore(_displayXO[3]);
      _stopTimer();
      notifyListeners();
    }

    //check 3rd row
    if(
    _displayXO[6] == _displayXO[7] &&
        _displayXO[6] == _displayXO[8] &&
        _displayXO[6] != ''
    ){
      _Winner = "Player " + _displayXO[6] + " wins!";
      _updateScore(_displayXO[6]);
      _stopTimer();
      notifyListeners();
    }

    //check 1st column
    if(
    _displayXO[0] == _displayXO[3] &&
        _displayXO[0] == _displayXO[6] &&
        _displayXO[0] != ''
    ){
      _Winner = "Player " + _displayXO[0] + " wins!";
      _updateScore(_displayXO[0]);
      _stopTimer();
      notifyListeners();
    }
    //check 2nd column
    if(
    _displayXO[1] == _displayXO[4] &&
        _displayXO[1] == _displayXO[7] &&
        _displayXO[1] != ''
    ){
      _Winner = "Player " + _displayXO[1] + " wins!";
      _updateScore(_displayXO[1]);
      _stopTimer();
      notifyListeners();
    }
    //check 3rd column
    if(
    _displayXO[2] == _displayXO[5] &&
        _displayXO[2] == _displayXO[8] &&
        _displayXO[2] != ''
    ){
      _Winner = "Player " + _displayXO[2] + " wins!";
      _updateScore(_displayXO[2]);
      _stopTimer();
      notifyListeners();
    }
    //check Diagonal
    if(
    _displayXO[0] == _displayXO[4] &&
        _displayXO[0] == _displayXO[8] &&
        _displayXO[0] != ''
    ){
      _Winner = "Player " + _displayXO[0] + " wins!";
      _updateScore(_displayXO[0]);
      _stopTimer();
      notifyListeners();
    }
    //check non Diagonal
    if(
    _displayXO[2] == _displayXO[4] &&
        _displayXO[2] == _displayXO[6] &&
        _displayXO[2] != ''
    ){
      _Winner = "Player " + _displayXO[2] + " wins!";
      _updateScore(_displayXO[2]);
      _stopTimer();
      notifyListeners();
    }
    else if(!haveWinner && _filledBoxes==9){
      _Winner = "Nobody Wins";
      notifyListeners();
    }
  }
  void _updateScore(String win){
    if(win == 'O'){
      _Oscore++;
      haveWinner = true;
    }else if(win == "X"){
      _Xscore++;
      haveWinner = true;
    }
  }
  void clearBoard(){
    for(int i=0;i<9;i++){
      _displayXO[i] = '';
    }
    _Winner = "";
    _filledBoxes = 0;
    haveWinner = !haveWinner;
    notifyListeners();
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),
        (_){
      if(seconds > 0){
        seconds--;
      }else {
        _stopTimer();
      }
        }
    );
    notifyListeners();
  }
  void _stopTimer(){
    _resetTimer();
    timer?.cancel();

  }
  void _resetTimer(){
    seconds = _maxSeconds;
  }
  double value(){
    double value = (1 - seconds / _maxSeconds) as double;
    return value;
    notifyListeners();
  }
}