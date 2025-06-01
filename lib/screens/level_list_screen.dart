import 'package:flutter/cupertino.dart';
import '../models/word.dart';
import '../services/word_service.dart';
import 'word_detail_screen.dart';

class LevelListScreen extends StatefulWidget {
  final int level;

  const LevelListScreen({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  State<LevelListScreen> createState() => _LevelListScreenState();
}

class _LevelListScreenState extends State<LevelListScreen> {
  final _wordService = WordService();
  Map<int, List<Word>>? chapters;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  Future<void> _loadWords() async {
    try {
      chapters = await _wordService.getWordsByLevelGrouped('n${widget.level}');
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error loading words: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey6,
        border: Border.all(color: CupertinoColors.transparent),
        middle: Text('JLPT N${widget.level}'),
      ),
      child: SafeArea(
        child: isLoading
            ? Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: chapters?.length ?? 0,
                itemBuilder: (context, index) {
                  final chapterNumber = index + 1;
                  var wordsInChapter = chapters![chapterNumber] ?? [];
                  var learnedCount = wordsInChapter.where((word) => word.isLearned).length;
                  
                  return CupertinoListSection.insetGrouped(
                    margin: EdgeInsets.only(bottom: 12),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: CupertinoListTile(
                          title: Text('$chapterNumber장'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${learnedCount}/${wordsInChapter.length}',
                                style: TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 8),
                              CupertinoListTileChevron(),
                            ],
                          ),
                          onTap: () async {
                            final updatedWords = await Navigator.push<List<Word>>(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => WordDetailScreen(
                                  words: wordsInChapter,
                                  initialIndex: learnedCount - 1,
                                  chapterNumber: chapterNumber,
                                ),
                              ),
                            );
                            
                            if (updatedWords != null) {
                              setState(() {
                                chapters![chapterNumber] = updatedWords;  // chapters 맵 직접 업데이트
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
} 