import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final Function(String) onCategoryChanged;

  const CategoryWidget({Key? key, required this.onCategoryChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          padding: EdgeInsets.all(9.r),

          child: SvgPicture.asset(Assets.svg.a3carat.path),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عقارات',
                style: AppTextStyles.titleSmall(color: AppTheme.secondaryColor),
              ),
              SizedBox(height: 2.h),
              Text(
                'فلل للبيع',
                style: AppTextStyles.bodySmall(color: AppTheme.greyColor),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            // Change category logic
          },
          child: Text(
            'تغيير',
            style: AppTextStyles.titleSmall(
              color: AppTheme.primaryColor,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
