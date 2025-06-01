import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/word.dart';

class WordService {
  Future<List<Word>> getWordsByLevel(String level) async {
    try {
      final String response = await rootBundle.loadString('assets/data/words.json');
      final List<dynamic> data = json.decode(response);
      final words = data
          .map((json) => Word.fromJson(json))
          .where((word) => word.level.toLowerCase() == level.toLowerCase())
          .toList();
      return words;
    } catch (e) {
      print('Error loading words: $e');
      rethrow;
    }
  }

  Future<Map<int, List<Word>>> getWordsByLevelGrouped(String level) async {
    final words = await getWordsByLevel(level);
    Map<int, List<Word>> chapterWords = {};
    
    // 10개씩 그룹화
    final int wordsPerChapter = 10;
    for (int i = 0; i < words.length; i++) {
      final chapterNum = (i ~/ wordsPerChapter) + 1;
      if (!chapterWords.containsKey(chapterNum)) {
        chapterWords[chapterNum] = [];
      }
      chapterWords[chapterNum]!.add(words[i]);
    }
    
    return chapterWords;
  }

  // 특정 챕터의 단어들만 가져오기
  Future<List<Word>> getWordsByChapter(String level, int chapter) async {
    final Map<int, List<Word>> groupedWords = await getWordsByLevelGrouped(level);
    return groupedWords[chapter] ?? [];
  }
} 