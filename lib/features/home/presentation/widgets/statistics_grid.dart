import 'package:crm_app/features/home/presentation/widgets/total_leads_card.dart';
import 'package:crm_app/features/home/presentation/widgets/total_meetings_card.dart';
import 'package:crm_app/features/home/presentation/widgets/total_project_card.dart';
import 'package:crm_app/features/home/presentation/widgets/total_propertise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatisticsGrid extends StatelessWidget {
  const StatisticsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 0.7, child: TotalProjectCard()),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1, // Taller for the leads card
          child: TotalLeadsCard(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1, // Taller for the properties card
          child: TotalPropertiesCard(),
        ),
        StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 0.7, child: TotalMeetingCard()),
      ],
    );
  }
}
