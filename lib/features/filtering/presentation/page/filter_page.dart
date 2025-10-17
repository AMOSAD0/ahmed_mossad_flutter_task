import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/category_widget.dart';
import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/filter_section_header_widget.dart';
import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/header_widget.dart';
import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/location_widget.dart';
import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/custom_text_field.dart';
import 'package:ahmed_mossad_flutter_task/features/filtering/presentation/widgets/type_selection_widget.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedCategory = 'الكل';
  String selectedType = 'الكل';
  String selectedRooms = '5 غرف+';
  String selectedPayment = 'كاش';
  String selectedStatus = 'جاهز';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 12.h),
                    const FilterSectionHeader(title: 'الفئة'),

                    SizedBox(height: 12.h),

                    CategoryWidget(
                      onCategoryChanged: (value) {
                        setState(() => selectedCategory = value);
                      },
                    ),

                    SizedBox(height: 28.h),
                  ],
                ),
              ),

              const LocationWidget(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                    const FilterSectionHeader(title: 'الأقساط الشهرية'),
                    SizedBox(height: 12.h),
                    const CustomTextField(),
                    SizedBox(height: 20.h),
                    const FilterSectionHeader(title: 'النوع'),
                    SizedBox(height: 12.h),

                    TypeSelectionWidget(
                      selectedType: selectedType,
                      types: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
                      onTypeChanged: (value) {
                        setState(() => selectedType = value);
                      },
                    ),

                    SizedBox(height: 20.h),
                    const FilterSectionHeader(title: 'عدد الغرف'),
                    SizedBox(height: 12.h),

                    TypeSelectionWidget(
                      selectedType: selectedRooms,
                      types: ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'],
                      onTypeChanged: (value) {
                        setState(() => selectedRooms = value);
                      },
                    ),

                    SizedBox(height: 20.h),
                    const FilterSectionHeader(title: 'السعر'),
                    SizedBox(height: 12.h),
                    const CustomTextField(
                      hintText1: 'أقل سعر',
                      hintText2: 'أقصى سعر',
                    ),

                    SizedBox(height: 20.h),
                    const FilterSectionHeader(title: 'طريقة الدفع'),
                    SizedBox(height: 12.h),

                    TypeSelectionWidget(
                      selectedType: selectedPayment,
                      types: ['أي', 'تقسيط', 'كاش'],
                      onTypeChanged: (value) {
                        setState(() => selectedPayment = value);
                      },
                    ),

                    SizedBox(height: 20.h),
                    const FilterSectionHeader(title: 'حالة العقار'),
                    SizedBox(height: 12.h),

                    TypeSelectionWidget(
                      selectedType: selectedStatus,
                      types: ['أي', 'جاهز', 'قيد الإنشاء'],
                      onTypeChanged: (value) {
                        setState(() => selectedStatus = value);
                      },
                    ),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: CustomPrimaryButton(
          text: 'شاهد 10,000+ نتائج',
          onPressed: () {},
        ),
      ),
    );
  }
}
