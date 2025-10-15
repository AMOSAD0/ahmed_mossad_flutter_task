import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribersBadge extends StatelessWidget {
  final int count;

  const SubscribersBadge({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 71.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: AppTheme.greenColor.withOpacity(0.05),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.r),
              topLeft: Radius.circular(32.r),
            ),
            border: Border(
              bottom: BorderSide.none,
              top: BorderSide(color: AppTheme.greenColor, width: 1.w),
              left: BorderSide(color: AppTheme.greenColor, width: 1.w),
              right: BorderSide(color: AppTheme.greenColor, width: 1.w),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Center(
              child: Text(
                count.toString(),
                style: AppTextStyles.titleSmall(
                  color: AppTheme.greenColor,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'ضعف عدد\nالمشاهدات',
          style: AppTextStyles.withUnderline(
            AppTextStyles.bodySmall(color: AppTheme.secondaryColor),
          ),
        ),
      ],
    );
  }
}
