import 'package:flutter/material.dart';
import '../../../data/models/unsplash_image.dart';
import '../../../core/services/unsplash_service.dart';
import '../../../data/models/speech_session.dart';
import 'package:go_router/go_router.dart';

class PresentationScreen extends StatefulWidget {
  final SpeechSession session;

  const PresentationScreen({super.key, required this.session});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  late Future<List<UnsplashImage>> _imagesFuture;
  int _currentSlide = 0;

  @override
  void initState() {
    super.initState();
    _imagesFuture = UnsplashService.getRandomImages(widget.session.slideCount);
  }

  void _nextSlide(int totalSlides) {
    if (_currentSlide < totalSlides - 1) {
      setState(() => _currentSlide++);
    } else {
      context.goNamed('applause');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UnsplashImage>>(
        future: _imagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Errore nel caricamento delle immagini'));
          }

          final images = snapshot.data!;
          final current = images[_currentSlide];

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                width: double.infinity,
                child: Text(
                  widget.session.theme,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Image.network(
                  current.url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => _nextSlide(images.length),
                  child: Text(_currentSlide < images.length - 1 ? 'Prossima' : 'Fine'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
