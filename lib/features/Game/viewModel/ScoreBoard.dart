import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/UiHelper/Custom%20Styles/custom_Styles.dart';
import 'package:tic_tac_toe/features/Game/Provider/Turn_Provider.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {
    int playerOScore = context.read<TurnProvider>().OScore();
    int playerXScore = context.read<TurnProvider>().XScore();
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Player O",style: customStyle,),
            Text(playerOScore.toString(),style: customStyle,)
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Text("Player X",style: customStyle,),
            Text(playerXScore.toString(),style: customStyle,)
          ],
        ),
      ],
    );
  }
}
