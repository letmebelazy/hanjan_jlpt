import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/core/constants/text_styles.dart';
import 'package:hanjan_jlpt/data/word_data.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/models/part_item.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/widgets/part_list_item.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/widgets/view_count_selector.dart';
import 'package:hanjan_jlpt/presentation/providers/current_level_provider.dart';
import 'package:hanjan_jlpt/presentation/providers/current_view_count_provider.dart';

class PartSelectPage extends ConsumerStatefulWidget {
  static String get routeName => 'part';
  const PartSelectPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PartSelectPageState();
}

class _PartSelectPageState extends ConsumerState<PartSelectPage> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final currentLevel = ref.watch(currentLevelProvider);
    final currentViewCount = ref.watch(currentViewCountProvider);
    final wordData = dataList[currentLevel - 1];

    return Scaffold(
      backgroundColor: baseColor,
      appBar: _AppBar(statusBarHeight: statusBarHeight),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ViewCountSelector(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: wordData.length ~/ currentViewCount,
              (context, index) {
                final item = PartItem(
                  level: currentLevel,
                  part: index + 1,
                  isViewCount100: currentViewCount == 100,
                  isActive: 
                );
                return PartListItem(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  final double statusBarHeight;

  _AppBar({required this.statusBarHeight});

  @override
  Size get preferredSize => Size.fromHeight(75.0 + statusBarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLevel = ref.watch(currentLevelProvider);
    final currentViewCount = ref.watch(currentViewCountProvider);

    return Container(
      height: 75.0 + statusBarHeight,
      color: primaryColor,
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 75.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.pop(),
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 50.0,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'N$currentLevel',
                  style: partAppbarLevelText,
                ),
                Text(
                  '$currentViewCount개씩 보기',
                  style: partAppbarViewCountText,
                ),
                const SizedBox(height: 5.0),
              ],
            ),
            SizedBox(
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
