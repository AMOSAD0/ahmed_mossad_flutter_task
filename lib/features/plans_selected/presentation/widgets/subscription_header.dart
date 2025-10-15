import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionHeader extends StatelessWidget {
  const SubscriptionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.43.w),
                child: SvgPicture.asset(Assets.svg.chevronRight.path),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'أختر الباقات اللى تناسبك',
              style: AppTextStyles.headlineSmall(
                color: AppTheme.secondaryColor,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 13.5.h),
        Text(
          'اختار من باقات التمييز يلى اسفل اللى تناسب احتياجاتك',
          style: AppTextStyles.bodySmall(color: AppTheme.greyColor),
        ),
      ],
    );
  }
}
