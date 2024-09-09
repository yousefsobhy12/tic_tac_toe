import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/score_screen.dart';

import '../widgets/custom_widget.dart';

// ignore: must_be_immutable
class GameView extends StatefulWidget {
  GameView({
    super.key,
    required this.player1,
    required this.player2,
  });

  String player1;
  String player2;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  List<String> buttonState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;
  bool isButtonPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(fontFamily: 'ToyBox'),
        ),
      ),
      body: Column(
        children: [
          ScoreScreen(
            player1Score: player1Score,
            player2Score: player2Score,
            player1: widget.player1,
            player2: widget.player2,
            resetScore: resetScore,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              height: 50,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomButton(
                    text: buttonState[0] ,
                    onPressed: onClickButton,
                    index: 0,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[1],
                    onPressed: onClickButton,
                    index: 1,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[2],
                    onPressed: onClickButton,
                    index: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomButton(
                    text: buttonState[3],
                    onPressed: onClickButton,
                    index: 3,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[4],
                    onPressed: onClickButton,
                    index: 4,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[5],
                    onPressed: onClickButton,
                    index: 5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomButton(
                    text: buttonState[6],
                    onPressed: onClickButton,
                    index: 6,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[7],
                    onPressed: onClickButton,
                    index: 7,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: buttonState[8],
                    onPressed: onClickButton,
                    index: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void resetScore() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
    });
  }

  int counter = 0;

  void onClickButton(int index) {
    if (buttonState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      buttonState[index] = 'X';
    } else {
      buttonState[index] = 'O';
    }

    bool checkTheWinner(String playerSymbol) {
      for (int i = 0; i < 9; i += 3) {
        if (buttonState[i] == playerSymbol &&
            buttonState[i + 1] == playerSymbol &&
            buttonState[i + 2] == playerSymbol) {
          return true;
        }
      }
      for (int i = 0; i < 3; i++) {
        if (buttonState[i] == playerSymbol &&
            buttonState[i + 3] == playerSymbol &&
            buttonState[i + 6] == playerSymbol) {
          return true;
        }
      }

      if (buttonState[0] == playerSymbol &&
              buttonState[4] == playerSymbol &&
              buttonState[8] == playerSymbol ||
          buttonState[2] == playerSymbol &&
              buttonState[4] == playerSymbol &&
              buttonState[6] == playerSymbol) {
        return true;
      }
      return false;
    }

    counter++;

    void resetButtons() {
      buttonState = List.filled(9, '');
      counter = 0;
      setState(() {});
    }

    if (checkTheWinner('X')) {
      customShowDialogMethod('${widget.player1} Won 🎉');
      player1Score += 1;
      resetButtons();
      setState(() {});
    } else if (checkTheWinner('O')) {
      customShowDialogMethod('${widget.player2} Won 🎉');
      player2Score += 1;
      resetButtons();
      setState(() {});
    } else if (counter == 9) {
      customShowDialogMethod('Draw!', content: 'طب ما تجربوا كمان مرة');
      resetButtons();
      setState(() {});
    }
    setState(() {});
  }

  Future<dynamic> customShowDialogMethod(String titleText, {String? content}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titleText,
          style: const TextStyle(
            fontFamily: 'ToyBox',
          ),),
        content: content != null ? Text(content) : null,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close',
              style: TextStyle(
                fontFamily: 'ToyBox',
              ),),
          ),
        ],
      ),
    );
  }
}
