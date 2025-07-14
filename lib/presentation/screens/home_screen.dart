import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../widgets/difficulty_selector.dart';
import '../widgets/number_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedIndex;
  final difficultyMap = ['easy', 'medium', 'hard', 'geek'];
  int _slideCount = 5;

  void _start() {
    if (_selectedIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleziona una difficoltà!')),
      );
      return;
    }

    final selectedDifficulty = difficultyMap[_selectedIndex!];

    context.goNamed(
      'loading',
      extra: {
        'difficulty': selectedDifficulty,
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
              const Text("Seleziona la difficolta'",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
              const SizedBox(height: 12),
              DifficultySelector(
                onSelected: (index) {
                  setState(() => _selectedIndex = index);
                },
                selectedIndex: _selectedIndex,
              ),
              const SizedBox(height: 32),
              const Text('Numero di slides',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
              const SizedBox(height: 12),
              NumberSelector(
                numbers: [3, 5, 7, 10, 15],
                onChanged: (value) => setState(() => _slideCount = value),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _start,
                child: const Text('Inizia!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}