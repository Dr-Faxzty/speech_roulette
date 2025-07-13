import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../widgets/difficulty_selector.dart';

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
      backgroundColor: AppConstants.primaryColor,
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
              const Text('Scegli la difficoltà:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              DifficultySelector(
                onSelected: (index) {
                  setState(() => _selectedIndex = index);
                },
                selectedIndex: _selectedIndex,
              ),
              const SizedBox(height: 32),
              const Text('Numero di slide:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              DropdownButton<int>(
                value: _slideCount,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _slideCount = value);
                  }
                },
                items: [3, 5, 7, 10, 15]
                    .map((val) => DropdownMenuItem(value: val, child: Text('$val')))
                    .toList(),
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
