import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            height: 24.h,
            width: 24.w,
            padding: EdgeInsets.all(2.r),
            child: SvgPicture.asset(Assets.svg.locationOn.path),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الموقع', style: AppTextStyles.titleSmall()),
                SizedBox(height: 2.h),
                Text(
                  'مصر',
                  style: AppTextStyles.bodySmall(color: AppTheme.greyColor),
                ),
              ],
            ),
          ),
          Container(
            height: 24.h,
            width: 24.w,
            padding: EdgeInsets.all(4.r),
            child: SvgPicture.asset(Assets.svg.chevronBackward.path),
          ),
        ],
      ),
    );
  }
}
