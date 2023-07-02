import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hanjan_jlpt/core/constants/strings.dart';
import 'package:hanjan_jlpt/core/constants/theme.dart';
import 'package:hanjan_jlpt/core/providers/router_provider.dart';

void main() {
  runApp(ProviderScope(
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: appName,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
