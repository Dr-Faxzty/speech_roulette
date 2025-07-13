import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/topic_loader.dart';
import '../../../data/models/speech_session.dart';

class LoadingScreen extends StatefulWidget {
  final String difficulty;
  final int slideCount;

  const LoadingScreen({
    super.key,
    required this.difficulty,
    required this.slideCount,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? _topic;

  @override
  void initState() {
    super.initState();
    _initFlow();
  }

  Future<void> _initFlow() async {
    final topic = TopicLoader.getRandomTopic(widget.difficulty.toString());
    setState(() => _topic = topic);

    await Future.delayed(const Duration(seconds: 3));

    final session = SpeechSession(
      theme: topic,
      difficulty: widget.difficulty,
      slideCount: widget.slideCount,
    );

    //context.goNamed('presentation', extra: session);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _topic == null
            ? const CircularProgressIndicator()
            : Text(
          'Diamo il benvenuto\nal massimo esperto di\n\n"${_topic!}"',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
