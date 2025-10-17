import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/entities/subscription_package.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/package_features.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageCard extends StatefulWidget {
  final SubscriptionPackage package;

  const PackageCard({Key? key, required this.package}) : super(key: key);

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 21.h),
            Container(
              margin: EdgeInsets.only(bottom: 13.h),
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
                          value: isSelect,
                          onChanged: (value) {
                            setState(() {
                              isSelect = !isSelect;
                            });
                          },
                          activeColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Text(
                          widget.package.name,
                          style: AppTextStyles.titleMedium(
                            color: isSelect
                                ? AppTheme.primaryColor
                                : AppTheme.secondaryColor,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Text(
                          '${widget.package.price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}${widget.package.currency}',
                          style:
                              AppTextStyles.titleMedium(
                                color: AppTheme.orangeColor,
                              ).copyWith(
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
                    PackageFeatures(package: widget.package),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (widget.package.badge != null)
          Positioned(
            right: 0,
            top: 0,
            child: Tag_widget(text: widget.package.badge!),
          ),
      ],
    );
  }
}
