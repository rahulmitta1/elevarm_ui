import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/screens/utilities_screen.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's error desktop screen.
class ElevarmErrorDesktopScreen extends StatelessWidget {
  /// Previous navigation button label.
  final String prevNavButtonLabel;

  /// Main navigation button label.
  final String mainNavButtonLabel;

  /// Previous navigation button action.
  final VoidCallback prevNavButtonAction;

  /// Main navigation button action.
  final VoidCallback mainNavButtonAction;

  /// Title of the error screen.
  final String title;

  /// Description of the error screen.
  final String description;

  const ElevarmErrorDesktopScreen({
    required this.prevNavButtonAction,
    required this.mainNavButtonAction,
    this.prevNavButtonLabel = 'Kembali Ke Sebelumnya',
    this.mainNavButtonLabel = 'Pergi Ke Dashboard',
    this.title = 'Ooopss.. Error!',
    this.description =
        'Halaman yang Anda cari tidak ada. Berikut ini beberapa tautan bermanfaat:', // ignore: lines_longer_than_80_chars
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 155,
            ),
            Image.asset(
              'packages/elevarm_ui/assets/images/error_illustration.png',
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: ElevarmFontFamilies.poppins(
                fontSize: 60,
                fontWeight: ElevarmFontWeights.bold,
                color: const Color(0xFF2F2F2F),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              description,
              style: LibraryTextStyles.interXlRegularGrey500,
            ),
            const SizedBox(
              height: 40,
            ),
            UtilitiesGroupButton(
              center: true,
              prevNavButtonLabel: prevNavButtonLabel,
              mainNavButtonLabel: mainNavButtonLabel,
              prevNavButtonAction: prevNavButtonAction,
              mainNavButtonAction: mainNavButtonAction,
            ),
          ],
        ),
      ),
    );
  }
}
