import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:unsplash_client/unsplash_client.dart';
import '../../data/models/unsplash_image.dart';

class UnsplashService {
  static final String _accessKey = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

  static final _client = UnsplashClient(
    settings: ClientSettings(credentials: AppCredentials(accessKey: _accessKey)),
  );

  static Future<List<UnsplashImage>> getRandomImages({
    required int count,
    String? orientation,
  }) async {
    if (_accessKey.isEmpty) {
      throw Exception('API key non trovata. Assicurati che .env sia configurato correttamente.');
    }

    debugPrint('Fetching $count images with orientation: $orientation');

    final request = _client.photos.random(
      count: count,
      orientation: orientation == 'Portrait'
          ? PhotoOrientation.portrait
          : PhotoOrientation.landscape,
    );

    final photos = await request.goAndGet();

    return photos.map((photo) {
      return UnsplashImage(
        id: photo.id,
        url: photo.urls.regular.toString(),
        author: photo.user.name.toString(),
        authorUrl: photo.user.links.html.toString(),
        width: photo.width,
        height: photo.height,
      );
    }).toList();
  }
}
