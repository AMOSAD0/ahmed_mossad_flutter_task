import 'package:ahmed_mossad_flutter_task/features/plans_selected/data/data_sources/subscription_local_data_source.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/data/repository/subscription_repository_impl.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/cubit/subscription_cubit.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/cubit/subscription_state.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/bottom_info_section.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/custom_button.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/package_card.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/subscription_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlansSelectedPage extends StatelessWidget {
  const PlansSelectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataSource = SubscriptionLocalDataSource();
    final repo = SubscriptionRepositoryImpl(dataSource);

    return BlocProvider(
      create: (_) => SubscriptionCubit(repo)..loadPackages(),
      child: Scaffold(
        appBar: SubscriptionAppBar(),
        body: SafeArea(
          child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
            builder: (context, state) {
              if (state is SubscriptionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SubscriptionLoaded ||
                  state is SubscriptionLoaded) {
                final packages = state.packages;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),

                        Column(
                          children: packages.asMap().entries.map((entry) {
                            final package = entry.value;
                            return PackageCard(package: package);
                          }).toList(),
                        ),

                        const BottomInfoSection(),
                        SizedBox(height: 200.h),
                      ],
                    ),
                  ),
                );
              } else if (state is SubscriptionError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('لا توجد باقات متاحة حالياً'));
              }
            },
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
      ),
    );
  }
}
