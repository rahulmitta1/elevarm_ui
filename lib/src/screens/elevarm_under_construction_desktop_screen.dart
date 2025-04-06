import 'package:elevarm_ui/src/screens/utilities_screen.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's under construction desktop screen.
class ElevarmUnderConstructionDesktopScreen extends StatelessWidget {
  /// Previous navigation button label.
  final String prevNavButtonLabel;

  /// Main navigation button label.
  final String mainNavButtonLabel;

  /// Previous navigation button action.
  final VoidCallback prevNavButtonAction;

  /// Main navigation button action.
  final VoidCallback mainNavButtonAction;

  /// Highlight of the under construction screen.
  final String highlight;

  /// Title of the under construction screen.
  final String title;

  /// Description of the under construction screen.
  final String description;

  /// Image of the under construction screen.
  final String image;

  const ElevarmUnderConstructionDesktopScreen({
    required this.prevNavButtonAction,
    required this.mainNavButtonAction,
    this.prevNavButtonLabel = 'Kembali Ke Sebelumnya',
    this.mainNavButtonLabel = 'Pergi Ke Dashboard',
    this.highlight = 'Under Construction!',
    this.title = 'Sedang Diperbaiki',
    this.description =
        '''Halaman yang Anda cari saat ini sedang dalam perbaikan dan akan segera kembali. Pantau terus!''',
    this.image =
        'packages/elevarm_ui/assets/images/under_construction_illustration.png',
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
