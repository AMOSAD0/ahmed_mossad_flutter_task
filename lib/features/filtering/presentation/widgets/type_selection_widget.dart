import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeSelectionWidget extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;
  final List<String> types;

  const TypeSelectionWidget({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: types.map((type) {
        final isSelected = selectedType == type;
        return FilterChip(
          label: Text(type),
          showCheckmark: false,
          selected: isSelected,
          onSelected: (selected) => onTypeChanged(type),
          backgroundColor: AppTheme.backgroundLight,
          selectedColor: AppTheme.primaryColor.withOpacity(0.05),
          labelStyle: AppTextStyles.titleSmall(
            color: isSelected ? AppTheme.primaryColor : AppTheme.greyColor,
          ),
          side: BorderSide(
            color: isSelected ? AppTheme.primaryColor : AppTheme.borderColor,
            width: isSelected ? 2.w : 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.5.h),
        );
      }).toList(),
    );
  }
}
