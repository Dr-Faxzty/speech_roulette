class ThemeItem {
  final String title;

  ThemeItem({required this.title});

  factory ThemeItem.fromJson(Map<String, dynamic> json) {
    return ThemeItem(title: json['title']);
  }

  Map<String, dynamic> toJson() => {
    'title': title,
  };
}
