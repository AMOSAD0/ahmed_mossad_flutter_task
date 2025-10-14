import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            icon: Assets.svg.home.path,
            label: 'الرئيسية',
          ),
          _buildNavItem(index: 1, icon: Assets.svg.chat.path, label: 'محادثة'),

          _buildMidNavItem(icon: Assets.svg.addBox.path, label: 'أضف أعلان'),
          _buildNavItem(
            index: 3,
            icon: Assets.svg.dataset.path,
            label: 'أعلاناتى',
          ),
          _buildNavItem(
            index: 4,
            icon: Assets.svg.accountCircle.path,
            label: 'حسابى',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        tween: Tween(begin: 0, end: isActive ? 1 : 0),
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppTheme.secondaryColor,
                        offset: const Offset(0, 1),
                        blurRadius: 0,
                        spreadRadius: 0,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 1 + (value * 0.15),
                  child: SvgPicture.asset(
                    icon,
                    height: 24.h,
                    width: 24.w,
                    color: isActive
                        ? AppTheme.secondaryColor
                        : AppTheme.secondaryColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  style: AppTextStyles.labelMedium(
                    color: Color.lerp(
                      Colors.grey,
                      AppTheme.secondaryColor,
                      value,
                    ),
                  ),

                  child: Text(label),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMidNavItem({required String icon, required String label}) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, height: 24.h, width: 24.w),
            SizedBox(height: 4.h),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              style: AppTextStyles.labelMedium(color: AppTheme.primaryColor),

              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
