import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

class ElevarmBreadcrumb extends StatelessWidget {
  final IconData icon;
  final List<String> steps;

  const ElevarmBreadcrumb({
    required this.icon,
    required this.steps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> breadcrumbs = [];
    for (var i = 0; i < steps.length; i++) {
      String step = steps[i];
      bool isLastStep = i == steps.length - 1;
      // Add step
      breadcrumbs.add(
        Text(
          step,
          style: !isLastStep
              ? LibraryTextStyles.interSmRegularNeutral400
              : LibraryTextStyles.interSmMediumPrimary500,
        ),
      );
      // Add separator if not last step
      if (!isLastStep) {
        breadcrumbs.addAll([
          const SizedBox(width: 8.0),
          const ElevarmIcon(
            ElevarmIconsOutline.chevron_right,
            size: 16,
            color: ElevarmColors.neutral200,
          ),
          const SizedBox(width: 8.0),
        ]);
      }
    }

    return Row(
      children: [
        ElevarmIcon(
          icon,
          color: ElevarmColors.neutral400,
          size: 16.0,
        ),
        const SizedBox(width: 4.0),
        ...breadcrumbs,
      ],
    );
  }
}
