class UnsplashImage {
  final String id;
  final String url;
  final String author;

  UnsplashImage({
    required this.id,
    required this.url,
    required this.author,
  });

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      url: json['urls']['regular'],
      author: json['user']['name'],
    );
  }
}
