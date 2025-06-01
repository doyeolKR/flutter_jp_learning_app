import 'package:flutter/cupertino.dart';
import '../models/word.dart';
import '../widgets/word_navigation.dart';
import '../widgets/word_card.dart';
import '../widgets/control_panel.dart';

class WordDetailScreen extends StatefulWidget {
  final List<Word> words;
  final int initialIndex;
  final int chapterNumber;

  const WordDetailScreen({
    Key? key,
    required this.words,
    required this.initialIndex,
    required this.chapterNumber,
  }) : super(key: key);

  @override
  State<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  late PageController _pageController;
  late int currentIndex;
  late ScrollController _scrollController;
  
  bool showFurigana = true;
  bool showMeaning = true;
  bool showExample = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
    _scrollController = ScrollController();
    
    _markWordsAsLearned();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const itemWidth = WordNavigation.ITEM_WIDTH;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final targetOffset = (currentIndex * itemWidth);
      final finalOffset = targetOffset.clamp(0.0, maxScroll);
      _scrollController.jumpTo(finalOffset);
    });
  }

  void _markWordsAsLearned() {
    for (int i = 0; i < widget.words.length; i++) {
      widget.words[i].isLearned = false;
    }
    for (int i = 0; i <= currentIndex; i++) {
      widget.words[i].isLearned = true;
    }
  }

  void _handlePageChange(int index) {
    setState(() {
      currentIndex = index;
      _markWordsAsLearned();
      
      final itemWidth = WordNavigation.ITEM_WIDTH;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final targetOffset = (currentIndex * itemWidth);
      final finalOffset = targetOffset.clamp(0.0, maxScroll);
      _scrollController.jumpTo(finalOffset);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.words);
        return false;
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('JLPT ${widget.words[0].level.toUpperCase()} ${widget.chapterNumber}장'),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              WordNavigation(
                words: widget.words,
                currentIndex: currentIndex,
                onWordSelect: (index) {
                  setState(() {
                    currentIndex = index;
                    _markWordsAsLearned();
                    _pageController.jumpToPage(index);
                  });
                },
                scrollController: _scrollController,
              ),
              
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.words.length,
                  onPageChanged: _handlePageChange,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        WordCard(
                          word: widget.words[index],
                          showFurigana: showFurigana,
                          showMeaning: showMeaning,
                          currentIndex: index + 1,
                          totalWords: widget.words.length,
                        ),
                      ],
                    );
                  },
                ),
              ),
              
              ControlPanel(
                showFurigana: showFurigana,
                showMeaning: showMeaning,
                showExample: showExample,
                onFuriganaToggle: (value) => setState(() => showFurigana = value),
                onMeaningToggle: (value) => setState(() => showMeaning = value),
                onExampleToggle: (value) => setState(() => showExample = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 