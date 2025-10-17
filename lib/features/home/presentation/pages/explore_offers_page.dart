import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/text_styles.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/category_tab.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/explore_offers_app_bar.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/filter_chip.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/free_shipping_banner.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ExploreOffersPage extends StatefulWidget {
  const ExploreOffersPage({Key? key}) : super(key: key);

  @override
  State<ExploreOffersPage> createState() => _ExploreOffersPageState();
}

class _ExploreOffersPageState extends State<ExploreOffersPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String selectedCategory = 'الكل';
  String selectedFilter = 'كل العروض';

  final List<String> categories = ['الكل', 'الكترونيات', 'اكسسوارات', 'ملابس'];

  final List<String> filters = [
    'شحن مجاني',
    'مميزات تحصيل',
    'مواصلات',
    'ساعات',
    'موضة رجال',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ExploreOffersAppBar(),
        body: Column(
          children: [
            SizedBox(height: 12.h),
            _buildCategoryTabs(),
            _buildFilterChips(),
            FreeShippingBanner(),
            SizedBox(height: 20.h),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0, 0.3, curve: Curves.easeOut),
        ),
      ),
      child: Container(
        height: 41.h,
        color: AppTheme.backgroundLight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryTabWidget(
              title: categories[index],
              isSelected: selectedCategory == categories[index],
              onTap: () {
                setState(() {
                  selectedCategory = categories[index];
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
            ),
          ),
      child: Container(
        height: 78.h,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 78.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return FilterChipWidget(
                    label: filters[index],
                    isSelected: selectedFilter == filters[index],
                    onTap: () {
                      setState(() {
                        selectedFilter = filters[index];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.44,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            final delay = index * 0.1;
            final animation = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  0.3 + delay > 1 ? 1 : 0.3 + delay,
                  1,
                  curve: Curves.easeOut,
                ),
              ),
            );

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: ProductCardWidget(index: index),
              ),
            );
          },
        );
      },
    );
  }
}
