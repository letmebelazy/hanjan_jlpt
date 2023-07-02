import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/core/constants/text_styles.dart';
import 'package:hanjan_jlpt/presentation/pages/level_select_page/models/level_item.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/part_select_page.dart';
import 'package:hanjan_jlpt/presentation/providers/current_level_provider.dart';

class LevelListItem extends ConsumerWidget {
  final LevelItem item;

  const LevelListItem({super.key, required this.item});

  Widget build(BuildContext context, WidgetRef ref) {
    final currentLevel = ref.watch(currentLevelProvider);

    if (item.level == currentLevel) {
      return _SelectedLevelListItem(item: item);
    }

    return _UnselectedLevelListItem(item: item);
  }
}

class _SelectedLevelListItem extends ConsumerWidget {
  final LevelItem item;
  const _SelectedLevelListItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        context.pushNamed(PartSelectPage.routeName);
      },
      child: Container(
        width: screenWidth * 0.8,
        height: 55.0,
        constraints: BoxConstraints(
          minWidth: 250.0,
          maxWidth: 350.0,
        ),
        decoration: BoxDecoration(
          color: baseColor,
          border: Border.all(color: baseColor, width: 1.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.0),
            bottomLeft: Radius.circular(100.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0.2,
              blurRadius: 15.0,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: SizedBox(
          width: 200.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10.0),
              SizedBox(
                width: 70.0,
                child: Text(
                  'N${item.level}',
                  style: levelLevelText.copyWith(color: primaryColor),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(width: 16.0),
              Text('•', style: levelDotText.copyWith(color: primaryColor)),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 90.0,
                child: Text(
                  '${item.wordCount}',
                  style: levelWordCountText.copyWith(color: primaryColor),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(width: 10.0),
              Icon(
                Icons.play_circle_filled,
                color: secondaryColor,
                size: 36.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _UnselectedLevelListItem extends ConsumerWidget {
  final LevelItem item;
  const _UnselectedLevelListItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        ref.read(currentLevelProvider.notifier).update((state) => item.level);
        context.pushNamed(PartSelectPage.routeName);
      },
      child: Stack(
        children: [
          Container(
            width: screenWidth * 0.6,
            height: 55.0,
            constraints: BoxConstraints(
              minWidth: 200.0,
              maxWidth: 300.0,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: baseColor, width: 1.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                bottomLeft: Radius.circular(100.0),
              ),
            ),
            child: SizedBox(
              width: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: 70.0,
                    child: Text(
                      'N${item.level}',
                      style: levelLevelText,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text('•', style: levelDotText),
                  const SizedBox(width: 16.0),
                  SizedBox(
                    width: 90.0,
                    child: Text(
                      '${item.wordCount}',
                      style: levelWordCountText,
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 1.5,
            right: 0.0,
            child: Container(
              width: 2.0,
              height: 52.0,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
