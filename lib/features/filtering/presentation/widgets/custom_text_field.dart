import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText1;
  final String hintText2;

  const CustomTextField({Key? key, this.hintText1 = '', this.hintText2 = ''})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.borderColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText1,
                  hintStyle: AppTextStyles.titleSmall(
                    color: AppTheme.greyColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.borderColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText2,
                  hintStyle: AppTextStyles.titleSmall(
                    color: AppTheme.greyColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
