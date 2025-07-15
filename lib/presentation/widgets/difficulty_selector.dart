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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Difficulty.values
          .where((d) => d != Difficulty.off)
          .map((difficulty) {
        final isSelected = selected == difficulty;

        return GestureDetector(
          onTap: () {
            setState(() => selected = difficulty);
            widget.onChanged?.call(difficulty);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: CrazyShake(
              active: isSelected,
              intensity: difficulty.shakeIntensity.toDouble(),
              child: Image.asset(isSelected ? difficulty.assetPath : Difficulty.off.assetPath, height: isSelected ? 84 : 72, width: isSelected ? 84 : 72,),
            ),
          ),
        );
      }).toList(),
    );
  }
}
