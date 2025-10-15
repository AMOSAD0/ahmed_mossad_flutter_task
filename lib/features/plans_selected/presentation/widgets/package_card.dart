import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/entities/subscription_package.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/package_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageCard extends StatelessWidget {
  final SubscriptionPackage package;
  final Function(bool) onToggle;

  const PackageCard({Key? key, required this.package, required this.onToggle})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppTheme.borderColor, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: package.isSelected,
                  onChanged: (value) => onToggle(value ?? false),
                  activeColor: const Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  package.name,
                  style: AppTextStyles.titleMedium().copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  '${package.price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}${package.currency}',
                  style: AppTextStyles.titleMedium(color: AppTheme.orangeColor)
                      .copyWith(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: AppTheme.orangeColor,
                        decorationThickness: 20.h,
                      ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(height: 1.h, color: AppTheme.borderColor),
            SizedBox(height: 12.h),
            PackageFeatures(package: package),
          ],
        ),
      ),
    );
  }
}
