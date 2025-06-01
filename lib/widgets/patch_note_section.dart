import 'package:flutter/cupertino.dart';

class PatchNoteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: EdgeInsets.zero,
      backgroundColor: CupertinoColors.systemGroupedBackground,
      children: [
        CupertinoListTile(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leadingSize: 38,
          leading: Container(
            width: 38,
            height: 38,
            child: const Text(
              '📢',
              style: TextStyle(
                fontFamily: 'Tossface',
                fontSize: 34,
              ),
            ),
          ),
          title: const Text('3.0.5'),
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('패치노트'),
              Text('음성 기능 개선'),
            ],
          ),
        ),
      ],
    );
  }
}
