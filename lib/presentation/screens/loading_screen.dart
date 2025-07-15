import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/topic_loader.dart';
import '../../../data/models/speech_session.dart';
import '../../core/constants/app_constants.dart';

class LoadingScreen extends StatefulWidget {
  final String difficulty;
  final int slideCount;
  final String orientation;

  const LoadingScreen({
    super.key,
    required this.difficulty,
    required this.slideCount,
    required this.orientation,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  String? _topic;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_controller);

    _initFlow();
  }

  Future<void> _initFlow() async {
    final topic = TopicLoader.getRandomTopic(widget.difficulty.toString());
    setState(() => _topic = topic);
    _controller.forward();

    await Future.delayed(const Duration(seconds: 3));

    final session = SpeechSession(
      topic: topic,
      difficulty: widget.difficulty,
      slideCount: widget.slideCount,
      orientation: widget.orientation
    );

    context.goNamed('presentation', extra: session);
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: Center(
        child: _topic == null
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpongeBoy',
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Diamo il benvenuto al massimo esperto di...'),
                    TextSpan(
                      text: _topic!,
                      style: const TextStyle(
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    const TextSpan(text: '!'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
