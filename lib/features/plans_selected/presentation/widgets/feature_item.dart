import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureItem extends StatelessWidget {
  final String text;
  final String icon;

  const FeatureItem({Key? key, required this.text, required this.icon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHighlighted = text.contains('خلال ال48 ساعة القادمة');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Padding(
              padding: EdgeInsets.all(3.5.r),
              child: SvgPicture.asset(icon),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.titleSmall(
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
              if (isHighlighted)
                Text(
                  '( خلال ال48 ساعة القادمة )',
                  style: AppTextStyles.titleSmall(color: AppTheme.orangeColor),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
