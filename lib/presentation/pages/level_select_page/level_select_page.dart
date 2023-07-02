import 'package:flutter/material.dart';

import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/data/word_data.dart';
import 'package:hanjan_jlpt/presentation/pages/level_select_page/models/level_item.dart';
import 'package:hanjan_jlpt/presentation/pages/level_select_page/widgets/level_list.dart';

class LevelSelectPage extends StatelessWidget {
  static String get routeName => 'level';
  LevelSelectPage({super.key});

  final List<LevelItem> items = List.generate(
    dataList.length,
    (index) => LevelItem(level: index + 1, wordCount: dataList[index].length),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenWidth * 0.4,
                  child: Image.asset('assets/main_icon.png'),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Image.asset('assets/main_title.png'),
                ),
                const SizedBox(height: 60.0),
                LevelList(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
