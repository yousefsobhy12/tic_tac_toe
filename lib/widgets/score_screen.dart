import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatefulWidget {
  ScoreScreen({
    super.key,
    required this.player1,
    required this.player2,
    required this.player1Score,
    required this.player2Score,
    this.resetScore,
  });

  int player1Score;
  int player2Score;
  String player1;
  String player2;
  Function? resetScore;
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '${widget.player1} (X)',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Score: ${widget.player1Score}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${widget.player2} (O)',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Score: ${widget.player2Score}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              widget.resetScore!();
            },
            child: const Text('Reset Score'),
          )
        ],
      ),
    );
  }
}
