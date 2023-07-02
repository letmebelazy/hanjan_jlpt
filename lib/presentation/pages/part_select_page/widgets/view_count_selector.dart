import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/core/constants/text_styles.dart';
import 'package:hanjan_jlpt/presentation/providers/current_view_count_provider.dart';

class ViewCountSelector extends ConsumerWidget {
  const ViewCountSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentViewCount = ref.watch(currentViewCountProvider);

    return SizedBox(
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(currentViewCountProvider.notifier).update((_) => 100);
            },
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor:
                  currentViewCount == 100 ? primaryColor : unfocusedColor,
              child: Text(
                '100',
                style: partViewCountSelectorText,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          GestureDetector(
            onTap: () {
              ref.read(currentViewCountProvider.notifier).update((_) => 200);
            },
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor:
                  currentViewCount != 100 ? primaryColor : unfocusedColor,
              child: Text(
                '200',
                style: partViewCountSelectorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
