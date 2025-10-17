import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tag_widget extends StatelessWidget {
  final String text;

  const Tag_widget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ClipPath(
        clipper: RibbonClipper(),
        child: Container(
          color: Color(0xFFFFDBDB),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              text,
              style: AppTextStyles.labelMedium(color: AppTheme.orangeColor),
            ),
          ),
        ),
      ),
    );
  }
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(10, size.height / 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
