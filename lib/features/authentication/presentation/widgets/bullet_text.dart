import 'package:flutter/material.dart';

import '/core/adaptive/text_style.dart';
import '/core/constants/colors.dart';

class BulletText extends StatelessWidget {
  final String content;
  const BulletText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: '●  ', style: TextStyle(color: AppColors.textColor)),
          TextSpan(
              text: content,
              style: AppTextStyle(context)
                  .appBodyStyle
                  ?.apply(fontSizeFactor: 1.3))
        ],
      ),
    );
  }
}
