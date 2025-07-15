import 'package:flutter/material.dart';
import '../../../data/models/orientation.dart' as model;

class OrientationSelector extends StatefulWidget {
  final void Function(model.Orientation)? onChanged;
  const OrientationSelector({super.key, this.onChanged});

  @override
  State<OrientationSelector> createState() => _OrientationSelectorState();
}

class _OrientationSelectorState extends State<OrientationSelector> {
  model.Orientation _selected = model.Orientation.landscape;

  void _toggleSelection(model.Orientation device) {
    setState(() {
      _selected = device;
    });
    widget.onChanged?.call(device);
  }

  Widget _buildDevice(model.Orientation device) {
    final isSelected = _selected == device;

    return GestureDetector(
      onTap: () => _toggleSelection(device),
      child: AnimatedOpacity(
        opacity: isSelected ? 1.0 : 0.7,
        duration: const Duration(milliseconds: 300),
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedRotation(
            turns: isSelected ? (20 / 360) : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              device.assetPath,
              width: 60,
              height: 60,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Row(
        children: [
          _buildDevice(model.Orientation.landscape),
          const SizedBox(width: 12),
          _buildDevice(model.Orientation.portrait),
        ],
      ),
    );
  }
}