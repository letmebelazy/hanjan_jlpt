import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/core/constants/text_styles.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/models/part_item.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/widgets/repeat_indicator.dart';
import 'package:hanjan_jlpt/presentation/providers/current_level_provider.dart';
import 'package:hanjan_jlpt/presentation/providers/current_view_count_provider.dart';

class PartListItem extends ConsumerWidget {
  final PartItem item;

  const PartListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLevel = ref.watch(currentLevelProvider);
    final currentViewCount = ref.watch(currentViewCountProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: baseColor,
            boxShadow: [
              if (item.isCurrent)
                BoxShadow(
                  color: Colors.black38.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 0.1,
                ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              Icon(
                Icons.play_circle_fill,
                color: item.isActive ? primaryColor : secondaryColor,
                size: 24.0,
              ),
              const SizedBox(width: 16.0),
              Text(
                'N$currentLevel',
                style: partLevelText,
              ),
              const SizedBox(width: 6.0),
              Container(
                width: 80.0,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Part${item.part}',
                  style: partPartText,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                '${currentViewCount * (item.part - 1)}-${currentViewCount * item.part}',
                style: partRangeText,
              ),
              Spacer(),
              RepeatIndicator(
                repeatCount: item.repeatCount,
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
