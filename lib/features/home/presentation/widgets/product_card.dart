import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;

  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: BorderRadius.circular(8.r),
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
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              image: DecorationImage(
                image: AssetImage(product.imageUrl),
                fit: BoxFit.contain,
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
                    Expanded(
                      child: Text(
                        product.name,
                        style: AppTextStyles.titleSmall(
                          color: AppTheme.secondaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (product.isDiscounted)
                      SvgPicture.asset(
                        Assets.svg.discount.path,
                        height: 20.h,
                        width: 20.w,
                      ),
                  ],
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    Text(
                      '${product.price} جم',
                      style: AppTextStyles.bodyMedium(
                        color: AppTheme.orangeColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (product.isDiscounted) ...[
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          '${product.discount} جم',
                          style: AppTextStyles.withLineThrough(
                            AppTextStyles.bodyMedium(color: AppTheme.greyColor),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () => setState(() => isFavorite = !isFavorite),
                      child: SvgPicture.asset(
                        Assets.svg.favorite.path,
                        height: 18.h,
                        width: 18.w,
                        color: isFavorite
                            ? AppTheme.orangeColor
                            : AppTheme.secondaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 11.5.h),

                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svg.localFireDepartment.path,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'تم بيع ${product.soldCount}+',
                      style: AppTextStyles.bodySmall(
                        color: AppTheme.greyColor,
                      ).copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                _buildIconCircul(Assets.svg.vector.path, AppTheme.primaryColor),
                Spacer(),
                _buildIconButton(Assets.svg.addShoppingCart.path, Colors.grey),
                SizedBox(width: 12.w),
                Image.asset(
                  Assets.png.logoTalaat.path,
                  height: 20.h,
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
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: SvgPicture.asset(icon, height: 16.h, width: 16.w),
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
