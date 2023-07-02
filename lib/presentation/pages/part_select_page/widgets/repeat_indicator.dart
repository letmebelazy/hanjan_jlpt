import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanjan_jlpt/core/constants/colors.dart';
import 'package:hanjan_jlpt/core/constants/text_styles.dart';

class RepeatIndicator extends ConsumerWidget {
  final int repeatCount;
  const RepeatIndicator({super.key, required this.repeatCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color color = baseColor;
    String repeatCountString = '';

    switch (repeatCount) {
      case 0:
        break;
      case 1:
        {
          color = oneRepeatColor;
          repeatCountString = '1';
          break;
        }
      case 2:
        {
          color = twoRepeatColor;
          repeatCountString = '2';
          break;
        }
      case 3:
        {
          color = threeRepeatColor;
          repeatCountString = '3';
          break;
        }
      case 4:
        {
          color = fourRepeatColor;
          repeatCountString = '4';
          break;
        }
      default:
        {
          color = fiveRepeatColor;
          repeatCountString = repeatCount.toString();
          break;
        }
    }
    return CircleAvatar(
      radius: 10.0,
      backgroundColor: color,
      child: Text(
        repeatCountString,
        style: partIndicatorText,
      ),
    );
  }
}
