import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/UiHelper/Color%20Pallete/Color_Pallete.dart';
import 'package:tic_tac_toe/UiHelper/Custom%20Styles/custom_Styles.dart';
import 'package:tic_tac_toe/features/Game/Provider/Turn_Provider.dart';
class BuildTimer extends StatelessWidget {
  const BuildTimer({super.key});
  @override
  Widget build(BuildContext context) {
    Timer? timer = context.watch<TurnProvider>().timer;
    final isRunning = timer == null? false : timer!.isActive;
    double value = context.read<TurnProvider>().value();
    String winner = context.watch<TurnProvider>().Winner();
    return isRunning?
        SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                backgroundColor: Pallete.winnerColor,
                value: value,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 8,
              ),
            ],
          ),
        )
        :Center(
      child: Column(
        children: [
          Text(
            winner,
            style: customStyle,
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                context.read<TurnProvider>().clearBoard();
                context.read<TurnProvider>().startTimer();

              },
              child: Text("Play Again"))
        ],
      ),
    );
  }
}
