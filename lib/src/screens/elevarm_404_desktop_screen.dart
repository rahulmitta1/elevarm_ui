import 'package:elevarm_ui/src/screens/utilities_screen.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's 404 desktop screen.
class Elevarm404DesktopScreen extends StatelessWidget {
  /// Previous navigation button label.
  final String prevNavButtonLabel;

  /// Main navigation button label.
  final String mainNavButtonLabel;

  /// Previous navigation button action.
  final VoidCallback prevNavButtonAction;

  /// Main navigation button action.
  final VoidCallback mainNavButtonAction;

  /// Highlight of the 404 screen.
  final String highlight;

  /// Title of the 404 screen.
  final String title;

  /// Description of the 404 screen.
  final String description;

  /// Image of the 404 screen.
  final String image;

  const Elevarm404DesktopScreen({
    required this.prevNavButtonAction,
    required this.mainNavButtonAction,
    this.prevNavButtonLabel = 'Kembali Ke Sebelumnya',
    this.mainNavButtonLabel = 'Pergi Ke Dashboard',
    this.highlight = 'Ooppss!',
    this.title = '404 Page not Found',
    this.description =
        'Maaf, halaman yang Anda cari tidak ada atau telah dipindahkan.',
    this.image = 'packages/elevarm_ui/assets/images/not_found_illustration.png',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UtilitiesScreen(
      highlight: highlight,
      title: title,
      description: description,
      image: image,
      prevNavButtonLabel: prevNavButtonLabel,
      mainNavButtonLabel: mainNavButtonLabel,
      prevNavButtonAction: prevNavButtonAction,
      mainNavButtonAction: mainNavButtonAction,
    );
  }
}
