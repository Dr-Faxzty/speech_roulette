import 'package:flutter/material.dart';

class DifficultySelector extends StatelessWidget {
  final int? selectedIndex;
  final void Function(int) onSelected;

  const DifficultySelector({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final difficulties = ['🥶', '🔥', '💀', '👨‍💻'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(difficulties.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onSelected(index),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              difficulties[index],
              style: TextStyle(fontSize: 24, color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        );
      }),
    );
  }
}
