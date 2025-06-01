import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '네코탄고',
          style: const TextStyle(
            fontFamily: 'Jalnan',
            fontSize: 20,
          ),
          // style: GoogleFonts.singleDay(
          //   fontSize: 24,
          //   fontWeight: FontWeight.w400,
          //   color: CupertinoColors.systemGrey,
          // ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text(
            '\u{1F601}', // Tossface 이모지
            style: TextStyle(
              fontFamily: 'Tossface', // 등록한 폰트 이름
              fontSize: 24,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
