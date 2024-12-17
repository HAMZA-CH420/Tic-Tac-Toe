import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/UiHelper/Color%20Pallete/Color_Pallete.dart';
import 'package:tic_tac_toe/UiHelper/Custom%20Styles/custom_Styles.dart';
import 'package:tic_tac_toe/features/Game/Provider/Turn_Provider.dart';
import 'package:tic_tac_toe/features/Game/viewModel/Game_Board.dart';
import 'package:tic_tac_toe/features/Game/viewModel/ScoreBoard.dart';
import 'package:tic_tac_toe/features/Game/viewModel/Timer_Button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String winner = context.watch<TurnProvider>().Winner();
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(child: Scoreboard()),
              flex: 1,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<TurnProvider>().tapped(index);
                    },
                    child: gameBoard(
                      index: index,
                    ),
                  );
                },
              ),
              flex: 3,
            ),
            BuildTimer(),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
