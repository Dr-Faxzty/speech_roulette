import 'package:flutter/material.dart';
import 'package:speech_roulette/presentation/widgets/shaking_image.dart';
import '../../../data/models/difficulty.dart';

class DifficultySelector extends StatefulWidget {
  final void Function(Difficulty)? onChanged;
  final Difficulty? initial;

  const DifficultySelector({this.onChanged, this.initial, super.key});

  @override
  State<DifficultySelector> createState() => _DifficultySelectorState();
}

class _DifficultySelectorState extends State<DifficultySelector> {
  Difficulty? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Difficulty.values
              .where((d) => d != Difficulty.off)
              .map((difficulty) {
            final isSelected = selected == difficulty;
            final double maxSize = isSelected ? 84 : 72;
            final double minSize = 48;
            final double screenWidth = MediaQuery.of(context).size.width;

            final double scaleFactor = screenWidth / 400.0;
            final double rawSize = maxSize * scaleFactor;

            final double size = rawSize.clamp(minSize, maxSize);

            return GestureDetector(
              onTap: () {
                setState(() => selected = difficulty);
                widget.onChanged?.call(difficulty);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: size * 0.2),
                child: CrazyShake(
                  active: isSelected,
                  intensity: difficulty.shakeIntensity.toDouble(),
                  child: Image.asset(
                    isSelected ? difficulty.assetPath : Difficulty.off.assetPath,
                    height: size,
                    width: size,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
