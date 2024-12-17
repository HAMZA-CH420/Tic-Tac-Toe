import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/UiHelper/Color%20Pallete/Color_Pallete.dart';
import 'package:tic_tac_toe/features/Game/Provider/Turn_Provider.dart';
class gameBoard extends StatefulWidget {
  const gameBoard({super.key,required this.index});
  final int index;
  @override
  State<gameBoard> createState() => _gameBoardState();
}

class _gameBoardState extends State<gameBoard> {
  @override
  Widget build(BuildContext context) {
    List displayValues = context.watch<TurnProvider>().displayXO();
    return  Container(
      decoration: BoxDecoration(
          color: Pallete.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Pallete.primaryColor,
            width: 3,)),
      child: Center(
        child: Text(displayValues[widget.index],style: GoogleFonts.coiny(
            color: Pallete.primaryColor,
            fontSize: 64
        ),),
      ),
    );
  }
}

