import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

// Base screen for under construction & 404 desktop page
class UtilitiesScreen extends StatelessWidget {
  /// Previous navigation button label.
  final String prevNavButtonLabel;

  /// Main navigation button label.
  final String mainNavButtonLabel;

  /// Previous navigation button action.
  final VoidCallback prevNavButtonAction;

  /// Main navigation button action.
  final VoidCallback mainNavButtonAction;

  /// Highlight for the base screen.
  final String highlight;

  /// Title for the base screen.
  final String title;

  /// Description for the base screen.
  final String description;

  /// Image for the base screen.
  final String image;

  const UtilitiesScreen({
    required this.highlight,
    required this.title,
    required this.description,
    required this.image,
    required this.prevNavButtonLabel,
    required this.mainNavButtonLabel,
    required this.prevNavButtonAction,
    required this.mainNavButtonAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 96),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      highlight,
                      style: LibraryTextStyles.interMdBoldPrimary,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      title,
                      style: ElevarmFontFamilies.poppins(
                        fontSize: 60,
                        fontWeight: ElevarmFontWeights.bold,
                        color: const Color(0xFF2F2F2F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 480,
                  child: Text(
                    description,
                    style: ElevarmFontFamilies.inter(
                      fontSize: ElevarmFontSizes.xl,
                      fontWeight: ElevarmFontWeights.regular,
                      color: const Color(0xFF9F9E9E),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                UtilitiesGroupButton(
                  center: false,
                  prevNavButtonLabel: prevNavButtonLabel,
                  mainNavButtonLabel: mainNavButtonLabel,
                  prevNavButtonAction: prevNavButtonAction,
                  mainNavButtonAction: mainNavButtonAction,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 56),
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}

class UtilitiesGroupButton extends StatelessWidget {
  /// Previous navigation button label.
  final String prevNavButtonLabel;

  /// Main navigation button label.
  final String mainNavButtonLabel;

  /// Previous navigation button action.
  final VoidCallback prevNavButtonAction;

  /// Main navigation button action.
  final VoidCallback mainNavButtonAction;

  /// Center a group of button.
  final bool center;

  /// Previous arrow left icon asset name.
  final IconData arrowLeft;

  const UtilitiesGroupButton({
    required this.center,
    required this.prevNavButtonLabel,
    required this.mainNavButtonLabel,
    required this.prevNavButtonAction,
    required this.mainNavButtonAction,
    this.arrowLeft = ElevarmIconsOutline.arrow_left,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ElevarmOutlineButton.icon(
          text: prevNavButtonLabel,
          leadingIconAssetName: arrowLeft,
          trailingIconAssetName: null,
          onPressed: prevNavButtonAction,
        ),
        const SizedBox(
          width: 12,
        ),
        ElevarmPrimaryButton.text(
          text: mainNavButtonLabel,
          height: 44,
          onPressed: mainNavButtonAction,
        ),
      ],
    );
  }
}
