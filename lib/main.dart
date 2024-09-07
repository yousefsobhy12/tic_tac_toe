import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/theme_service.dart';
import 'package:tic_tac_toe/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(TicTacToe(theme: initTheme));
}

class TicTacToe extends StatelessWidget {

  const TicTacToe({super.key, required this.theme});

  final ThemeData theme;

  @override
    Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme.copyWith(
        textTheme: theme.textTheme.apply(
          fontFamily: 'ToyBox',
        ),
      ),
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomeView(),
        );
      },
    );
  }
}
