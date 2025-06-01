import 'package:flutter/cupertino.dart';

class ControlPanel extends StatelessWidget {
  final bool showFurigana;
  final bool showMeaning;
  final bool showExample;
  final Function(bool) onFuriganaToggle;
  final Function(bool) onMeaningToggle;
  final Function(bool) onExampleToggle;

  const ControlPanel({
    Key? key,
    required this.showFurigana,
    required this.showMeaning,
    required this.showExample,
    required this.onFuriganaToggle,
    required this.onMeaningToggle,
    required this.onExampleToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildControlButton(
            icon: 'あ',
            label: '히라가나',
            isSelected: showFurigana,
            onTap: () => onFuriganaToggle(!showFurigana),
          ),
          _buildControlButton(
            icon: '㉧',
            label: '의미',
            isSelected: showMeaning,
            onTap: () => onMeaningToggle(!showMeaning),
          ),
          _buildControlButton(
            icon: '文',
            label: '예문',
            isSelected: showExample,
            onTap: () => onExampleToggle(!showExample),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            icon,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? CupertinoColors.black
                  : CupertinoColors.systemGrey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? CupertinoColors.black
                  : CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }
} 