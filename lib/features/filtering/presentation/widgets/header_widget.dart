import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FilterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.backgroundLight,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: SvgPicture.asset(Assets.svg.closeSmall.path),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'فلترة',
              style: AppTextStyles.headlineSmall(
                color: AppTheme.secondaryColor,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12.w, left: 12.w),
          child: Center(
            child: Text(
              'رجوع للأفتراضى',
              style: AppTextStyles.titleMedium(
                color: AppTheme.primaryColor,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
