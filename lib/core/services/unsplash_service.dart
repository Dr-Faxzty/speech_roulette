import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../data/models/unsplash_image.dart';

class UnsplashService {
  static final String _accessKey = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';
  static const String _endpoint = 'https://api.unsplash.com/photos/random';

  static Future<List<UnsplashImage>> getRandomImages(int count) async {
    if (_accessKey.isEmpty) {
      throw Exception('API key non trovata. Assicurati che .env sia configurato correttamente.');
    }

    final uri = Uri.parse('$_endpoint?count=$count');
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Client-ID $_accessKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((e) => UnsplashImage.fromJson(e)).toList();
    } else {
      throw Exception('Errore durante il caricamento immagini');
    }
  }
}