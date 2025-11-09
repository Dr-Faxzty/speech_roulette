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
    final screenWidth = MediaQuery.of(context).size.width;

    double scale(double base) => (base * screenWidth / 400).clamp(base * 0.6, base);

    final double fontSizeSelected = scale(48);
    final double fontSizeUnselected = scale(36);
    final double containerSize = scale(100);
    final double padding = scale(16);

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
            width: containerSize,
            height: containerSize,
            padding: EdgeInsets.all(padding),
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: isSelected ? -0.2 : 0,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                style: TextStyle(
                  fontFamily: 'SpongeBoy',
                  fontSize: isSelected ? fontSizeSelected : fontSizeUnselected,
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
