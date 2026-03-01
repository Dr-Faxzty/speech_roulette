import '../../data/models/unsplash_image.dart';

abstract class IUnsplashService {
  Future<List<UnsplashImage>> getRandomImages({
    required int count,
    String? orientation,
  });
}