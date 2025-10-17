import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SubscriptionAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(83.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 16.h,
            top: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.43.w),
                        child: SvgPicture.asset(Assets.svg.chevronRight.path),
                      ),
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
          ),
        ),
      ),
    );
  }
}
