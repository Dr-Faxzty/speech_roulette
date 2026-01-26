class UnsplashImage {
  final String id;
  final String url;
  final String author;
  final String authorUrl;
  final int width;
  final int height;

  UnsplashImage({
    required this.id,
    required this.url,
    required this.author,
    required this.authorUrl,
    required this.width,
    required this.height,
  });

  double get aspectRatio => width / height;

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      url: json['urls']['regular'],
      author: json['user']['name'],
      authorUrl: json['user']['links'],
      width: json['width'],
      height: json['height'],
    );
  }
}
