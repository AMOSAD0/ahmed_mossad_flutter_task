import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/entities/subscription_package.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/bottom_info_section.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/custom_button.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/package_card.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/subscription_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlansSelectedPage extends StatelessWidget {
  const PlansSelectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packages = _getMockPackages();

    return Scaffold(
      appBar: SubscriptionAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Column(
                  children: packages.map((package) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: PackageCard(
                        package: package,
                        onToggle: (isSelected) {
                          print(
                            'Package ${package.name} selected: $isSelected',
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),

                const BottomInfoSection(),
                SizedBox(height: 200.h),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: CustomPrimaryButton(
          text: 'التالى',
          icon: Icons.arrow_forward,
          onPressed: () {},
        ),
      ),
    );
  }

  List<SubscriptionPackage> _getMockPackages() {
    return [
      SubscriptionPackage(
        id: '1',
        name: 'اساسية',
        price: 23000,
        currency: 'ج.م',
        isSelected: false,
        validityDays: 30,
        subscribersCount: 0,
        features: ['صلاحية الأعلان 30 يوم'],
      ),
      SubscriptionPackage(
        id: '2',
        name: 'أفضل!',
        price: 23000,
        currency: 'ج.م',
        isSelected: true,
        validityDays: 30,
        subscribersCount: 7,
        features: [
          'رفع الى اعلى القائمة كل 3 أيام',
          'تثبيت في مقابل صبحي',
          'تثبيت في مقابل صبحي ',
        ],
        badge: 'أفضل قيمة مقابل سعر',
      ),
      SubscriptionPackage(
        id: '3',
        name: 'بلس',
        price: 23000,
        currency: 'ج.م',
        isSelected: true,
        validityDays: 30,
        subscribersCount: 18,
        features: [
          'رفع الى اعلى القائمة كل 2 يوم',
          'تثبيت في مقابل صبحي',
          'تثبيت في مقابل صبحي (خلال ال48 ساعة القادمة)',
          'ظهور في كل محافظات مصر',
          'اعلان مميز',
          'تثبيت في مقابل صبحي في الجعران',
          'تثبيت في مقابل صبحي',
          'تثبيت في مقابل صبحي (خلال ال48 ساعة القادمة)',
        ],
        badge: 'اعلى متابعات',
      ),
      SubscriptionPackage(
        id: '4',
        name: 'سوبر',
        price: 23000,
        currency: 'ج.م',
        isSelected: false,
        validityDays: 30,
        subscribersCount: 24,
        features: [
          'رفع الى اعلى القائمة كل 2 يوم',
          'تثبيت في مقابل صبحي',
          'تثبيت في مقابل صبحي (خلال ال48 ساعة القادمة)',
          'ظهور في كل محافظات مصر',
          'اعلان مميز',
          'تثبيت في مقابل صبحي في الجعران',
          'تثبيت في مقابل صبحي',
          'تثبيت في مقابل صبحي (خلال ال48 ساعة القادمة)',
        ],
      ),
    ];
  }
}
