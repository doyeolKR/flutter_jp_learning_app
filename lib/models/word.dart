class Example {
  final String japanese;
  final String furigana;
  final String meaning;

  Example({
    required this.japanese,
    required this.furigana,
    required this.meaning,
  });

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      japanese: json['japanese'],
      furigana: json['furigana'],
      meaning: json['meaning'],
    );
  }
}

class Word {
  final String id;
  final String kanji;
  final String furigana;
  final String meaning;
  final String level;
  final List<Example> examples;
  bool isLearned;
  final List<String> tags;
  
  Word({
    required this.id,
    required this.kanji,
    required this.furigana,
    required this.meaning,
    required this.level,
    required this.examples,
    this.isLearned = false,
    required this.tags,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'],
      kanji: json['kanji'],
      furigana: json['furigana'],
      meaning: json['meaning'],
      level: json['level'],
      examples: (json['examples'] as List)
          .map((e) => Example.fromJson(e))
          .toList(),
      isLearned: json['isLearned'] ?? false,
      tags: List<String>.from(json['tags']),
    );
  }
} 