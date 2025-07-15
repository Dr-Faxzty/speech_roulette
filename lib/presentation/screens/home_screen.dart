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
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Speech Roulette',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              const Text(
                "Seleziona la difficolta'",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              DifficultySelector(
                initial: _selectedDifficulty,
                onChanged: (difficulty) {
                  setState(() => _selectedDifficulty = difficulty);
                },
              ),

              const SizedBox(height: 32),

              const Text(
                'Numero di slides',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

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
}
