import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../widgets/difficulty_selector.dart';
import '../widgets/number_selector.dart';
import '../widgets/orientation_selector.dart';
import '../widgets/play_button.dart';
import '../../../data/models/difficulty.dart';
import '../../../data/models/orientation.dart' as model;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Difficulty? _selectedDifficulty = Difficulty.easy;
  model.Orientation _selectedOrientation = model.Orientation.landscape;
  int _slideCount = 3;

  void _start() {
    context.goNamed(
      'loading',
      extra: {
        'difficulty': _selectedDifficulty!.name,
        'slideCount': _slideCount,
        'orientation': _selectedOrientation.name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: 40,
            ),
            const SizedBox(width: 16),
            buildTitle("SPEECH ROULETTE", fontSize: 32),
          ],
        ),
        actions: [Image.asset('assets/img/gif/penguin.gif', height: 100)],
        backgroundColor: AppConstants.backgroundColor,
      ),
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTitle("Seleziona la difficolta'", fontSize: 60),

                  const SizedBox(height: 12),

                  DifficultySelector(
                    initial: Difficulty.easy,
                    onChanged: (difficulty) {
                      setState(() => _selectedDifficulty = difficulty);
                    },
                  ),

                  const SizedBox(height: 32),

                  buildTitle("Numero di slides", fontSize: 60),

                  const SizedBox(height: 12),

                  NumberSelector(
                    numbers: [3, 5, 7, 10, 15],
                    onChanged: (value) => setState(() => _slideCount = value),
                  ),

                  const SizedBox(height: 12),

                  BouncingPlayButton(onPressed: _start),
                ],
              ),

              OrientationSelector(
                onChanged: (orientation) => setState(() {
                  _selectedOrientation = orientation;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String text, {double fontSize = 32}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}