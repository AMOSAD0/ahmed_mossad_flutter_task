import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ExploreOffersAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ExploreOffersAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60); // ارتفاع الـ AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white, // أو AppTheme.backgroundLight
      elevation: 0,
      titleSpacing: 16, // نفس الـ horizontal padding
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'استكشاف العروض',
            style: AppTextStyles.titleMedium(color: AppTheme.secondaryColor),
          ),
          InkWell(
            onTap: () => context.pushNamed('filter'),
            child: Row(
              children: [
                Text(
                  'الكل',
                  style: AppTextStyles.titleMedium(
                    color: AppTheme.greyColor,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 2.w),
                SvgPicture.asset(
                  Assets.svg.arrowBack.path,
                  height: 15.16.h,
                  width: 15.57.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
