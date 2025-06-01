import 'package:flutter/cupertino.dart';

class QuickAccessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: EdgeInsets.zero,
      backgroundColor: CupertinoColors.systemGroupedBackground,
      children: [
        CupertinoListTile(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leadingSize: 37,
          leading: Container(
            width: 37,
            height: 37,
            alignment: Alignment.center,
            child: const Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '🔥',
                style: TextStyle(
                  fontFamily: 'Tossface',
                  fontSize: 24,
                ),
              ),
            ),
          ),
          title: const Text(
            '바로 공부하기',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: const Text(
            'N1 5장 바로 가기',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
