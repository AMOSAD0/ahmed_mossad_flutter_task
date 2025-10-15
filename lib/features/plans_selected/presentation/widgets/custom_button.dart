import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color backgroundColor;
  final double borderRadius;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = const Color(0xFF007AFF),
    this.borderRadius = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: AppTextStyles.button()),
          if (icon != null) ...[
            SizedBox(width: 8.w),
            Icon(icon, color: Colors.white, size: 20.r),
          ],
        ],
      ),
    );
  }
}
