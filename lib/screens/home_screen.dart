import 'package:flutter/cupertino.dart';
import '../widgets/home_header.dart';
import '../widgets/patch_note_section.dart';
import '../widgets/quick_access_section.dart';
import '../widgets/jlpt_level_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: 4),
              Expanded(
                child: ListView(
                  children: [
                    PatchNoteSection(),
                    SizedBox(height: 12),
                    QuickAccessSection(),
                    SizedBox(height: 12),
                    JLPTLevelList(),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 