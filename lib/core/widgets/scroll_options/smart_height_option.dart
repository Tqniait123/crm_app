// lib/core/widgets/scroll_options/smart_height_option.dart

import 'package:flutter/material.dart';
import 'package:project_name/core/theme/colors.dart';
import 'package:project_name/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:project_name/features/home/presentation/widgets/parking_widget.dart';

import '../empty_error_states.dart';
import '../shimmer_card.dart';
import 'base_scroll_option.dart';

class SmartHeightOption extends BaseScrollOption {
  const SmartHeightOption({super.key, required super.state, required super.onRefresh, super.height});

  @override
  Widget buildContent(BuildContext context) {
    if (state is ParkingsLoading) return const ShimmerLoadingWidget();
    if (state is! ParkingsSuccess || (state as ParkingsSuccess).parkings.isEmpty) {
      return const EmptyStateWidget();
    }

    final parkings = (state as ParkingsSuccess).parkings;
    const double itemHeight = 120.0;
    const double separatorHeight = 16.0;
    const double visibleItems = 2.5; // Show 2 full + half of next
    final double listHeight = (visibleItems * itemHeight) + ((visibleItems - 1) * separatorHeight);

    return Container(
      height: listHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: parkings.length,
            separatorBuilder: (context, index) => const SizedBox(height: separatorHeight),
            itemBuilder: (context, index) {
              return SizedBox(
                height: itemHeight,
                child: ParkingCard(parking: parkings[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
