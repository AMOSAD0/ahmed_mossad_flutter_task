import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

    final itemWidth = screenWidth < 360
        ? screenWidth * 0.85
        : screenWidth < 400
        ? 150.w
        : 200.w;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4.w,
        children: [
          SizedBox(height: 16.h, width: 16.w, child: SvgPicture.asset(icon)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: itemWidth),
                child: Text(
                  text.replaceAll('خلال ال48 ساعة القادمة', ''),
                  textAlign: TextAlign.right,
                  style: AppTextStyles.titleSmall(
                    color: AppTheme.secondaryColor,
                  ),
                  softWrap: true,
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
