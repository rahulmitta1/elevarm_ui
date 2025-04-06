import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Wrapper [ElevarmDrawer] for desktop layout.
class ElevarmDesktopDrawer extends StatefulWidget {
  /// Currently active route path.
  final String currentRoutePath;

  /// Callback when route is changing.
  final void Function(
    BuildContext context,
    String? routePath,
  ) onChangedRoutePath;

  /// Animation duration.
  final Duration duration;

  /// Drawer main menus (below header).
  final List<ElevarmDrawerMenu> mainMenus;

  /// Drawer secondary menus (above profile).
  final List<ElevarmDrawerMenu> secondaryMenus;

  /// Profile title.
  final String profileTitle;

  /// Profile subtitle.
  final String profileSubtitle;

  /// Profile image provider.
  final ImageProvider? profileImageProvider;

  /// Callback when logout button is pressed.
  final void Function(BuildContext context) onPressedLogout;

  /// Logout button icon asset name.
  final IconData logoutIconAssetName;

  /// Chevron right icon asset name.
  final IconData chevronRightIconAssetName;

  /// Elevarm logo image asset name.
  final String elevarmLogoImageAssetName;

  /// Whether to show Elevarm logo.
  final bool showHeaderLogo;

  /// Header title widget.
  final Widget headerTitle;

  /// Header subtitle widget.
  final Widget headerSubtitle;

  /// The drawer content widget.
  final Widget child;

  /// Whether to show profile
  final bool isShowProfile;

  const ElevarmDesktopDrawer({
    required this.currentRoutePath,
    required this.onChangedRoutePath,
    required this.profileTitle,
    required this.profileSubtitle,
    required this.onPressedLogout,
    required this.headerTitle,
    required this.headerSubtitle,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.mainMenus = const [],
    this.secondaryMenus = const [],
    this.profileImageProvider,
    this.logoutIconAssetName = ElevarmIconsOutline.log_out_01,
    this.chevronRightIconAssetName = ElevarmIconsOutline.chevron_right,
    this.elevarmLogoImageAssetName =
        'packages/elevarm_ui/assets/images/elevarm_logo_white.svg',
    this.showHeaderLogo = true,
    this.isShowProfile = true,
    super.key,
  });

  @override
  State<ElevarmDesktopDrawer> createState() => _ElevarmDesktopDrawerState();
}

class _ElevarmDesktopDrawerState extends State<ElevarmDesktopDrawer> {
  bool _isDrawerExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevarmDrawer(
              currentRoutePath: widget.currentRoutePath,
              onExpandDrawer: () {
                _handleExpandDrawer(true);
              },
              isDrawerExpanded: _isDrawerExpanded,
              onChangedRoutePath: widget.onChangedRoutePath,
              profileTitle: widget.profileTitle,
              profileSubtitle: widget.profileSubtitle,
              profileImageProvider: widget.profileImageProvider,
              onPressedLogout: widget.onPressedLogout,
              mainMenus: widget.mainMenus,
              secondaryMenus: widget.secondaryMenus,
              logoutIconAssetName: widget.logoutIconAssetName,
              chevronRightIconAssetName: widget.chevronRightIconAssetName,
              elevarmLogoImageAssetName: widget.elevarmLogoImageAssetName,
              showHeaderLogo: widget.showHeaderLogo,
              headerTitle: widget.headerTitle,
              headerSubtitle: widget.headerSubtitle,
              isShowProfile: widget.isShowProfile,
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
        AnimatedPositioned(
          left: _isDrawerExpanded ? 304.0 - 10.0 : 82.0 - 10.0,
          top: 32.0,
          duration: const Duration(milliseconds: 200),
          child: Material(
            color: ElevarmColors.success,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                _handleExpandDrawer(!_isDrawerExpanded);
              },
              child: AnimatedRotation(
                turns: _isDrawerExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: ElevarmIcon(
                  widget.chevronRightIconAssetName,
                  size: 20.0,
                  color: ElevarmColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleExpandDrawer(bool newValue) {
    setState(() {
      _isDrawerExpanded = newValue;
    });
  }
}
