import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmAppBarSearchAndAction extends AppBar {
  /// [BuildContext] is used to give default callback on pressing back button
  final BuildContext context;

  /// Hint text in search input field
  final String? searchHintText;

  /// [List] of action widgets
  final List<Widget> actionWidgets;

  /// [VoidCallback] for pressing back button
  final VoidCallback? callbackPressingBack;

  /// Callback for submitting search
  final Function(String)? callbackSubmittingSearch;

  ElevarmAppBarSearchAndAction({
    required this.actionWidgets,
    required this.context,
    double? elevation,
    this.callbackPressingBack,
    this.callbackSubmittingSearch,
    this.searchHintText,
    super.key,
  }) : super(
          leading: ElevarmTertiaryNeutralButton.iconOnly(
            iconAssetName: ElevarmIconsOutline.arrow_left,
            onPressed: callbackPressingBack ??
                () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
          ),
          centerTitle: true,
          elevation: elevation,
          titleSpacing: 0,
          title: ElevarmTextInputField(
            hintText: searchHintText,
            prefixIconAssetName: ElevarmIconsOutline.search_md,
            onFieldSubmitted: callbackSubmittingSearch,
          ),
          actions: actionWidgets,
        );

  /// Predefined [ElevarmAppBarSearchAndAction]
  /// for search field and shopping cart action button
  factory ElevarmAppBarSearchAndAction.shoppingCart({
    required BuildContext context,
    required int badgeCount,
    required VoidCallback callbackPressingCartButton,
    double? elevation,
    String? searchHintText,
  }) =>
      ElevarmAppBarSearchAndAction(
        searchHintText: searchHintText,
        actionWidgets: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ElevarmTertiaryNeutralButton.iconOnly(
                height: ElevarmButtonHeights.xl2,
                iconAssetName: ElevarmIconsOutline.shopping_cart_01,
                onPressed: callbackPressingCartButton,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ElevarmColors.danger,
                  ),
                  child: Center(
                    child: Text(
                      badgeCount.toString(),
                      style: ElevarmFontFamilies.inter(
                        fontSize: 10,
                        color: ElevarmColors.white,
                        fontWeight: ElevarmFontWeights.semibold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        context: context,
        elevation: elevation,
      );
}
