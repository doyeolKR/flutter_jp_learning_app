import 'package:flutter/cupertino.dart';
import '../models/word.dart';

class WordNavigation extends StatelessWidget {
  final List<Word> words;
  final int currentIndex;
  final Function(int) onWordSelect;
  final ScrollController scrollController;

  // 상수 정의
  static const double CIRCLE_WIDTH = 60.0;
  static const double CIRCLE_MARGIN = 8.0;
  static const double ITEM_WIDTH = CIRCLE_WIDTH + (CIRCLE_MARGIN * 2);

  const WordNavigation({
    Key? key,
    required this.words,
    required this.currentIndex,
    required this.onWordSelect,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: words.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onWordSelect(index),
            child: Container(
              width: CIRCLE_WIDTH,
              height: CIRCLE_WIDTH,
              margin: EdgeInsets.symmetric(horizontal: CIRCLE_MARGIN),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index 
                  ? CupertinoColors.activeBlue 
                  : CupertinoColors.systemGrey5,
              ),
              child: Center(
                child: Text(
                  words[index].kanji,
                  style: TextStyle(
                    color: currentIndex == index 
                      ? CupertinoColors.white 
                      : CupertinoColors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 