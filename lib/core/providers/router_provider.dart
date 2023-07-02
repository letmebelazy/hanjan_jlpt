import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hanjan_jlpt/presentation/pages/level_select_page/level_select_page.dart';
import 'package:hanjan_jlpt/presentation/pages/part_select_page/part_select_page.dart';

final routerProvider = Provider((_) {
  return GoRouter(
    initialLocation: '/level',
    routes: [
      GoRoute(
        path: '/level',
        name: LevelSelectPage.routeName,
        builder: (_, __) => LevelSelectPage(),
      ),
      GoRoute(
        path: '/part',
        name: PartSelectPage.routeName,
        builder: (_, __) => PartSelectPage(),
      ),
    ],
  );
});
