import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../widgets/difficulty_selector.dart';
import '../widgets/number_selector.dart';
import '../widgets/orientation_selector.dart';
import '../widgets/play_button.dart';
import '../widgets/responsive_title.dart';
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
            ResponsiveTitle("SPEECH ROULETTE", maxFontSize: 32),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDifficulty = Difficulty.geek;
                _slideCount = 7;
                _selectedOrientation = model.Orientation.landscape;
              });
              _start();
            },
            child: Image.asset(
              Difficulty.geek.assetPath,
              height: 100,
            ),
          ),
        ],
        backgroundColor: AppConstants.backgroundColor,
      ),
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ResponsiveTitle("Seleziona la difficolta'", maxFontSize: 60),
                          const SizedBox(height: 12),

                          DifficultySelector(
                            initial: Difficulty.easy,
                            onChanged: (difficulty) {
                              setState(() => _selectedDifficulty = difficulty);
                            },
                          ),

                          const SizedBox(height: 32),

                          ResponsiveTitle("Numero di slides", maxFontSize: 60),

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
          },
        ),
      ),
    );
  }
}