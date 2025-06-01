import 'package:flutter/cupertino.dart';

class LevelCard extends StatelessWidget {
  final String level;
  final String subtitle;
  final VoidCallback onTap;

  const LevelCard({
    Key? key,
    required this.level,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  String _getEmoji() {
    switch (level) {
      case 'N5':
        return '🌱';
      case 'N4':
        return '🌻';
      case 'N3':
        return '🐥';
      case 'N2':
        return '🌸';
      case 'N1':
        return '🎓';
      default:
        return '📚';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGrey6,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _getEmoji(),
                    style: const TextStyle(
                      fontFamily: 'Tossface',
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey3,
            ),
          ],
        ),
      ),
    );
  }
} 