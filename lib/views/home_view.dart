import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/theme_service.dart';
import 'package:tic_tac_toe/views/game_view.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String pageRoute = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controllerX = TextEditingController();
  final TextEditingController controllerO = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Enter players\' Names',
            style: TextStyle(
              fontFamily: 'ToyBox',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ThemeSwitcher(
                builder: (context) {
                  bool isDarkMode = ThemeModelInheritedNotifier.of(context)
                          .theme
                          .brightness ==
                      Brightness.light;
                  String themeName = isDarkMode ? 'dark' : 'light';
                  return DayNightSwitcherIcon(
                    isDarkModeEnabled: isDarkMode,
                    onStateChanged: (bool darkMode) async {
                      var service = await ThemeService.instance
                        ..save(darkMode ? 'light' : 'dark');
                      var theme = service.getByName(themeName);
                      ThemeSwitcher.of(context)
                          .changeTheme(theme: theme, isReversed: darkMode);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              name: 'Player 1',
              prefixIcon: FontAwesomeIcons.x,
              controller: controllerX,
            ),
            CustomTextField(
              name: 'Player 2',
              prefixIcon: FontAwesomeIcons.o,
              controller: controllerO,
            ),
            ElevatedButton(
              onPressed: () {
                if (controllerX.text.isEmpty) {
                  controllerX.text = 'Player 1';
                }
                if (controllerO.text.isEmpty) {
                  controllerO.text = 'Player 2';
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => GameView(
                      player1: controllerX.text,
                      player2: controllerO.text,
                    ),
                  ),
                );
              },
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Text(
                      'Let\'s go',
                      style: TextStyle(
                        fontFamily: 'ToyBox',
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
