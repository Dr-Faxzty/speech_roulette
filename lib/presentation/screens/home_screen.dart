import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_roulette/presentation/widgets/play_button.dart';
import '../../../core/constants/app_constants.dart';
import '../widgets/difficulty_selector.dart';
import '../widgets/number_selector.dart';
import '../../../data/models/difficulty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Difficulty? _selectedDifficulty;
  int _slideCount = 5;

  void _start() {
    if (_selectedDifficulty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleziona una difficoltà!')),
      );
      return;
    }

    context.goNamed(
      'loading',
      extra: {
        'difficulty': _selectedDifficulty!.name,
        'slideCount': _slideCount,
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
            buildTitle("Speech Roulette", fontSize: 32),
          ],
        ),
        actions: [Image.asset('assets/img/gif/penguin.gif', height: 100)],
        backgroundColor: AppConstants.backgroundColor,
      ),
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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