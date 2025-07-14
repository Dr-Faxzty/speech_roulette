import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final List<int> numbers;
  final void Function(int)? onChanged;

  const NumberSelector({required this.numbers, this.onChanged, super.key});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  int selected = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.numbers.map((number) {
        final isSelected = number == selected;
        return GestureDetector(
          onTap: () {
            setState(() => selected = number);
            widget.onChanged?.call(number);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: isSelected ? -0.2 : 0,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                style: TextStyle(
                  fontFamily: 'SpongeBoy',
                  fontSize: isSelected ? 48 : 36,
                  color: isSelected ? Colors.orange : Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
                child: Text('$number'),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}