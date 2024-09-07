import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/home_view.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ToyBox',
        brightness: Brightness.dark,
      ),
      home: const HomeView(),
    );
  }
}
