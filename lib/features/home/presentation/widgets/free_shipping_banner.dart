import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeShippingBanner extends StatelessWidget {
  const FreeShippingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppTheme.orangLightColor, // لون خلفية ناعم مائل للوردي
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check, color: AppTheme.greenColor, size: 22.r),
          SizedBox(width: 6.w),
          Text(
            'شحن مجاني',
            style: AppTextStyles.bodySmall(color: AppTheme.greenColor),
          ),
          const Spacer(),
          Text(
            'لأى عرض تطلبه دلوقتى !',
            style: AppTextStyles.bodySmall(
              color: AppTheme.secondaryColor,
            ).copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
