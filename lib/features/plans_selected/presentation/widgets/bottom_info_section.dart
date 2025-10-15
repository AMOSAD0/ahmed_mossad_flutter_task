import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomInfoSection extends StatelessWidget {
  const BottomInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppTheme.whiteGreyColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppTheme.borderColor, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'باقات مخصصة لك',
            style: AppTextStyles.titleSmall(color: AppTheme.secondaryColor),
          ),
          SizedBox(height: 4.h),
          Text(
            'تواصل معنا لاختيار الباقة المناسبة لك',
            style: AppTextStyles.bodySmall(color: AppTheme.secondaryColor),
          ),
          SizedBox(height: 4.h),
          GestureDetector(
            onTap: () {
              // Handle contact action
            },
            child: Text(
              'فريق المبيعات',
              style: AppTextStyles.titleMedium(
                color: AppTheme.primaryColor,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
