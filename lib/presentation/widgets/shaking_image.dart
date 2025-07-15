import 'dart:math';
import 'package:flutter/material.dart';

class CrazyShake extends StatefulWidget {
  final Widget child;
  final bool active;
  final double intensity; // pixels

  const CrazyShake({
    super.key,
    required this.child,
    required this.active,
    this.intensity = 4.0,
  });

  @override
  State<CrazyShake> createState() => _CrazyShakeState();
}

class _CrazyShakeState extends State<CrazyShake>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Random _random = Random();
  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
      if (widget.active) {
        _generateRandomOffset();
      } else {
        _offset = Offset.zero;
      }
      setState(() {});
    });

    if (widget.active) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant CrazyShake oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.active && _controller.isAnimating) {
      _controller.stop();
      _offset = Offset.zero;
    }
  }

  void _generateRandomOffset() {
    final dx = (_random.nextDouble() * 2 - 1) * widget.intensity;
    final dy = (_random.nextDouble() * 2 - 1) * widget.intensity;
    _offset = Offset(dx, dy);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: _offset,
        child: widget.child,
    );
  }
}
