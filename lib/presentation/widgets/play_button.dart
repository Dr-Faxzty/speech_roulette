import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class BouncingPlayButton extends StatefulWidget {
  final VoidCallback onPressed;

  const BouncingPlayButton({required this.onPressed, super.key});

  @override
  State<BouncingPlayButton> createState() => _BouncingPlayButtonState();
}

class _BouncingPlayButtonState extends State<BouncingPlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnim;
  late Animation<double> _squashAnim;

  bool _hovering = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _bounceAnim = Tween<double>(begin: 0, end: -20)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    _squashAnim = Tween<double>(begin: 1.0, end: 0.7)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _hovering) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed && _hovering) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEnterEvent event) {
    setState(() => _hovering = true);
    _controller.forward();
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _hovering = false);
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppConstants.primaryColor,
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, _bounceAnim.value),
                    child: Transform.scale(
                      alignment: Alignment.bottomCenter,
                      scaleY: _squashAnim.value,
                      scaleX: 1.0,
                      child: child,
                    ),
                  );
                },
                child: const Icon(
                  Icons.play_arrow,
                  size: 70,
                  color: AppConstants.darkColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
