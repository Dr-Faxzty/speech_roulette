import 'package:flutter/material.dart';
import '../../../data/models/unsplash_image.dart';
import '../../../core/services/unsplash_service.dart';
import '../../../data/models/speech_session.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

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
    _imagesFuture = UnsplashService.getRandomImages(count: widget.session.slideCount, orientation: widget.session.orientation);
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
      backgroundColor: Colors.grey[100],
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

          return SafeArea(
            child: Column(
              children: [
                // Top Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    widget.session.topic.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFC107), // giallo
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                // Image Card
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: AspectRatio(
                        aspectRatio: current.aspectRatio,
                        child: Image.network(
                          current.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Author Credits
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Photo by ',
                          style: TextStyle(color: Colors.black54),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => launchUrl(Uri.parse(current.authorUrl)),
                            child: Text(
                              current.author,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4CAF50),
                              ),
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: ' on ',
                          style: TextStyle(color: Colors.black54),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => launchUrl(Uri.parse('https://unsplash.com')),
                            child: const Text(
                              'Unsplash',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4CAF50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Navigation Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Prev
                      ElevatedButton(
                        onPressed: _currentSlide > 0
                            ? () => setState(() => _currentSlide--)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                        ),
                        child: const Text('prev', style: TextStyle(color: Colors.white,)),
                      ),
                      const SizedBox(width: 24),

                      // Slide counter
                      Text(
                        '${_currentSlide + 1}/${images.length}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Next
                      ElevatedButton(
                        onPressed: () => _nextSlide(images.length),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC107),
                        ),
                        child: Text(_currentSlide < images.length - 1 ? 'next' : 'end', style: TextStyle(color: Colors.black,),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
