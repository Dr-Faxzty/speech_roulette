import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:unsplash_client/unsplash_client.dart';
import '../../data/models/unsplash_image.dart';
import 'i_unsplash_service.dart';

class UnsplashService implements IUnsplashService {
  late final UnsplashClient _client;

  UnsplashService() {
    final accessKey = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

    if (accessKey.isEmpty) {
      throw Exception('API key non trovata. Configura .env correttamente.');
    }

    _client = UnsplashClient(
      settings: ClientSettings(
        credentials: AppCredentials(accessKey: accessKey),
      ),
    );
  }

  @override
  Future<List<UnsplashImage>> getRandomImages({
    required int count,
    String? orientation,
  }) async {
    final request = _client.photos.random(
      count: count,
      orientation: orientation?.toLowerCase() == 'portrait'
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