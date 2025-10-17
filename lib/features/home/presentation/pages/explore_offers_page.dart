import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/subcategory.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/category_tab.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/explore_offers_app_bar.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/filter_chip.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/free_shipping_banner.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/widgets/product_card.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreOffersPage extends StatefulWidget {
  const ExploreOffersPage({Key? key}) : super(key: key);

  @override
  State<ExploreOffersPage> createState() => _ExploreOffersPageState();
}

class _ExploreOffersPageState extends State<ExploreOffersPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String? selectedCategory;
  String? selectedFilter;

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
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsError) {
              return Center(child: Text(state.message));
            } else if (state is ProductsLoaded) {
              final categories = [
                'الكل',
                ...state.categories.map((e) => e.name),
              ];
              final filters = [...state.subcategories.map((e) => e)];

              selectedCategory ??= 'الكل';

              final filteredProducts = state.products.where((product) {
                final matchCategory =
                    selectedCategory == 'الكل' ||
                    state.categories
                            .firstWhere((c) => c.id == product.categoryId)
                            .name ==
                        selectedCategory;

                return matchCategory;
              }).toList();

              return Column(
                children: [
                  SizedBox(height: 12.h),
                  _buildCategoryTabs(categories),
                  _buildFilterChips(filters),
                  const FreeShippingBanner(),
                  SizedBox(height: 20.h),
                  Expanded(child: _buildProductGrid(filteredProducts)),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(List<String> categories) {
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

  Widget _buildFilterChips(List<SubCategory> filters) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          itemBuilder: (context, index) {
            return FilterChipWidget(
              label: filters[index].name,
              isSelected: selectedFilter == filters[index].name,
              image: filters[index].image,
              onTap: () {
                setState(() {
                  selectedFilter = filters[index].name;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductGrid(List products) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (products.isEmpty) {
          return const Center(child: Text('لا توجد منتجات حالياً'));
        }
        final screenWidth = MediaQuery.of(context).size.width;
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: screenWidth < 400 ? 0.38 : 0.44,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
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
                child: ProductCardWidget(product: product),
              ),
            );
          },
        );
      },
    );
  }
}
