import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

///The status of each step in the stepper
enum ElevarmStepperStepStatus {
  uncompleted,
  ongoing,
  completed,
}

class ElevarmStepperStep {
  /// Stepper's title.
  final String title;

  /// Stepper's subtitle.
  final String subtitle;

  /// Callback when the stapper is tapped.
  final VoidCallback? onTap;

  ElevarmStepperStep({
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

/// Elevarm UI's Stepper component widget.
class ElevarmStepper extends StatelessWidget {
  final List<ElevarmStepperStep> steps;
  final int currentStep;

  const ElevarmStepper({
    required this.steps,
    required this.currentStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        int index = entry.key;
        ElevarmStepperStep step = entry.value;
        ElevarmStepperStepStatus status = ElevarmStepperStepStatus.uncompleted;
        if (index < currentStep) {
          status = ElevarmStepperStepStatus.completed;
        } else if (index == currentStep) {
          status = ElevarmStepperStepStatus.ongoing;
        }
        return _buildStep(
          status: status,
          title: step.title,
          subtitle: step.subtitle,
          onTap: step.onTap,
          isLast: index >= steps.length - 1,
        );
      }).toList(),
    );
  }

  Widget _buildStep({
    required ElevarmStepperStepStatus status,
    required bool isLast,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return SizedBox(
      height: 66.0,
      child: Row(
        children: [
          Column(
            children: [
              _buildStepIcon(status),
              const SizedBox(height: 4.0),
              !isLast
                  ? Container(
                      height: 36.0,
                      width: 2.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: status == ElevarmStepperStepStatus.completed
                            ? ElevarmColors.primary
                            // ignore: deprecated_member_use_from_same_package
                            : ElevarmColors.grey200, // FIXME
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: LibraryTextStyles.interSmSemiboldGrey700,
                    ),
                    Text(
                      subtitle,
                      style: LibraryTextStyles.interSmRegularGrey600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon(ElevarmStepperStepStatus status) {
    Color color;
    Widget child;
    switch (status) {
      case ElevarmStepperStepStatus.uncompleted:
        // ignore: deprecated_member_use_from_same_package
        color = ElevarmColors.grey100; // FIXME
        child = Container(
          height: 8.0,
          width: 8.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ElevarmColors.white,
          ),
        );
        break;
      case ElevarmStepperStepStatus.ongoing:
        color = ElevarmColors.primary;
        child = Container(
          height: 8.0,
          width: 8.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ElevarmColors.white,
          ),
        );
        break;
      case ElevarmStepperStepStatus.completed:
        color = ElevarmColors.primary;
        child = const SizedBox(
          height: 14.0,
          width: 14.0,
          child: ElevarmIcon(
            ElevarmIconsOutline.check,
            color: Colors.white,
          ),
        );
        break;
    }
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
