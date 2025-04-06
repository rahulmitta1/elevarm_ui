import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

class ElevarmSwitchListTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  final int? maxLinesTitle;
  final String positiveLabel;
  final String negativeLabel;
  final ElevarmSwitchSize switchSize;

  const ElevarmSwitchListTile({
    required this.title,
    required this.value,
    this.onChanged,
    this.maxLinesTitle = 2,
    this.positiveLabel = 'Ya',
    this.negativeLabel = 'Tidak',
    this.switchSize = ElevarmSwitchSize.sm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ElevarmColors.white,
      borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
      child: InkWell(
        onTap: onChanged != null
            ? () {
                onChanged!(!value);
              }
            : null,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ElevarmColors.neutral100),
            borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: maxLinesTitle,
                    overflow: TextOverflow.ellipsis,
                    style: LibraryTextStyles.interSmMediumNeutral,
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevarmSwitch(
                  value: value,
                  title: value ? positiveLabel : negativeLabel,
                  size: switchSize,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
