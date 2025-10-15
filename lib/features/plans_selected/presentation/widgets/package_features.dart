import 'package:ahmed_mossad_flutter_task/asset/gen/assets.gen.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/entities/subscription_package.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/feature_item.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/widgets/subscribers_badge.dart';
import 'package:flutter/material.dart';

class PackageFeatures extends StatelessWidget {
  final SubscriptionPackage package;

  const PackageFeatures({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      Assets.svg.acute.path,
      Assets.svg.rocket.path,
      Assets.svg.keep.path,
      Assets.svg.globe.path,
      Assets.svg.acute.path,
      Assets.svg.workspacePremium.path,
      Assets.svg.keep.path,
      Assets.svg.keep.path,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...package.features.asMap().entries.map((entry) {
              final index = entry.key;
              final feature = entry.value;
              return FeatureItem(text: feature, icon: icons[index]);
            }),
          ],
        ),

        if (package.subscribersCount > 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SubscribersBadge(count: package.subscribersCount)],
          ),

        // if (package.badge != null) BadgeWidget(text: package.badge!),
      ],
    );
  }
}
