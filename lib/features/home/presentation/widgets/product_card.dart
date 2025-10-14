import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductCardWidget extends StatefulWidget {
  final int index;

  const ProductCardWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 215.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 60,
                color: Colors.grey[300],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 118.w),
                      child: Text(
                        'جاكيت من الصوف مناسب',
                        style: AppTextStyles.titleSmall(
                          color: AppTheme.secondaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      Assets.svg.discount.path,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 110.w),
                      child: Row(
                        children: [
                          Text(
                            '32,000,000',
                            style: AppTextStyles.bodyMedium(
                              color: AppTheme.orangeColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Flexible(
                            child: Text(
                              'جم/',
                              style: AppTextStyles.bodyMedium(
                                color: AppTheme.orangeColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),

                          Flexible(
                            child: Text(
                              '50جم ',
                              style: AppTextStyles.withLineThrough(
                                AppTextStyles.bodyMedium(
                                  color: AppTheme.greyColor,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: SvgPicture.asset(
                          Assets.svg.favorite.path,
                          height: 17.68.h,
                          width: 20.w,
                          color: isFavorite
                              ? AppTheme.orangeColor
                              : AppTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 11.5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.localFireDepartment.path,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'تم بيع 3.3k+',
                      style: AppTextStyles.bodySmall(
                        color: AppTheme.greyColor,
                      ).copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                _buildIconCircul(Assets.svg.vector.path, AppTheme.primaryColor),
                SizedBox(width: 45.w),
                _buildIconButton(Assets.svg.addShoppingCart.path, Colors.grey),
                SizedBox(width: 12.w),
                Image.asset(
                  Assets.png.logoTalaat.path,
                  height: 22.h,
                  width: 15.w,
                  color: AppTheme.secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconCircul(String icon, Color color) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: SvgPicture.asset(icon, height: 16.h, width: 16.w),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.check,
              size: 12.r,
              color: AppTheme.backgroundLight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(String icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: SvgPicture.asset(icon, height: 16.h, width: 16.w),
    );
  }
}
