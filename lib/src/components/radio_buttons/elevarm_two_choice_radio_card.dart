import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmTwoChoiceRadioCard<T> extends StatelessWidget {
  /// The possible values.
  final List<ElevarmRadioItemModel<T>> items;

  /// The currently selected value for this group of radio buttons.
  final T? groupValue;

  /// Callback when radio button value is changed. Set this value to null to
  /// disable the radio button.
  final ValueChanged<T>? onChanged;

  final ElevarmRadioButtonSize size;

  const ElevarmTwoChoiceRadioCard({
    required this.groupValue,
    required this.onChanged,
    required this.items,
    this.size = ElevarmRadioButtonSize.sm,
    super.key,
  }) : assert(items.length == 2, 'items should have length of 2');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildRadioCard(context, items[0]),
        const SizedBox(width: 16.0),
        _buildRadioCard(context, items[1]),
      ],
    );
  }

  Widget _buildRadioCard(
    BuildContext context,
    ElevarmRadioItemModel<T> item,
  ) {
    bool enabled = onChanged != null;
    return Expanded(
      child: Material(
        color: enabled ? ElevarmColors.white : ElevarmColors.neutral50,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        child: InkWell(
          onTap: enabled
              ? () {
                  onChanged!(item.value);
                }
              : null,
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
              border: Border.all(color: ElevarmColors.neutral100),
            ),
            child: Center(
              child: ElevarmRadioButton<T>(
                title: item.title,
                value: item.value,
                size: size,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
