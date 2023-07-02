import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPartBy100Provider =
    StateProvider.family<int, int>((ref, level) => -1);
final currentPartBy200Provider =
    StateProvider.family<int, int>((ref, level) => -1);
