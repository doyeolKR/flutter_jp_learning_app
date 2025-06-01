import 'package:flutter/cupertino.dart';
import 'level_card.dart';
import '../screens/level_list_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class JLPTLevelList extends StatelessWidget {
  final List<String> messages = [
    '처음 공부해 봐요',
    '자신감이 붙었어요',
    '제법 여유가 생겼어요',
    '한계를 뛰어넘어요',
    '끝까지 도전해 볼래요'
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: EdgeInsets.zero,
      separatorColor: CupertinoColors.white,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Align(alignment: Alignment.centerLeft,
            child: Text(
            'JLPT',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),)
        ),
        ...List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: LevelCard(
              level: 'N${5-index}',
              subtitle: messages[index],
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => LevelListScreen(level: 5-index),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
} 