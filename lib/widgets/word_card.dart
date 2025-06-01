import 'package:flutter/cupertino.dart';
import '../models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;
  final bool showFurigana;
  final bool showMeaning;
  final int currentIndex;
  final int totalWords;

  const WordCard({
    Key? key,
    required this.word,
    required this.showFurigana,
    required this.showMeaning,
    required this.currentIndex,
    required this.totalWords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: showFurigana ? Text(
                    word.furigana,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.systemGrey,
                    ),
                  ) : null,
                ),
              ),
              SizedBox(
                height: 80,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    word.kanji,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: showMeaning ? Text(
                    word.meaning,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.systemGrey,
                    ),
                  ) : null,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              '$currentIndex/$totalWords',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 