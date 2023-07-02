import 'package:flutter/material.dart';

import 'package:hanjan_jlpt/presentation/pages/level_select_page/models/level_item.dart';
import 'package:hanjan_jlpt/presentation/pages/level_select_page/widgets/level_list_item.dart';

class LevelList extends StatelessWidget {
  final List<LevelItem> items;
  const LevelList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      reverse: true,
      itemCount: items.length,
      itemBuilder: (_, index) {
        return Align(
          alignment: Alignment.centerRight,
          child: LevelListItem(
            item: items[index],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints(
            minHeight: 10.0,
            maxHeight: 20.0,
          ),
        );
      },
    );
  }
}
