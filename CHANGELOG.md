# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.11.5] - 19-02-2025
### Changed
- Update additional information section in Readme.

## [0.11.4] - 13-02-2025
### Fixed
- Fix wrong alignment in `ElevarmTypeAheadInputField`.

## [0.11.3] - 13-02-2025
### Added
- Add `ElevarmUiUtils` utils for showing dialog.

### Fixed
- Fix asterisk always showing up in `ElevarmInputFieldLabel` widget.
- Fix text overflow in `ElevarmRadioButton` widget.

## [0.11.2] - 03-02-2025
### Added
- Add Bitbucket Pipelines step for code metrics.
- Add `profileSubtitleSuffix` and `onTapProfileSubtitleSuffix` parameter in `ElevarmDrawer` widget.

### Fixed
- Fix overflow for long label in `ElevarmInputFieldLabel` widget.

## [0.11.1] - 08-01-2025
### Added
- Add `ElevarmTwoChoiceRadioCard` widget.
- Add `ElevarmRadioItemModel` model.
- Add `prefixIconAssetName` to `ElevarmDropdownInputField` widget.

## [0.11.0] - 23-12-2024
### Added
- Add `suffixIconColor` and `suffixErrorIconColor` properties to `ElevarmTextInputField` widget.

### Changed
- Refactor `ElevarmOtpField` from Elevarm App.

### Fixed
- Fix SnackBar shadow not disappearing.

## [0.10.8] - 04-10-2024
### Added
- Add `ElevarmTagInputField` widget.

### Changed
- Update `ElevarmPasswordStrength` widget with latest design.
- Update Bitbucket Pipelines image version to 3.22.3.
- Update Getting Started section in README.md.
- Update deprecated APIs.

## [0.10.7] - 08-08-2024
### Changed
- Make `positiveText`, `negativeText`, `onPositiveButton`, and `onNegativeButton` nullable in `ElevarmConfirmAlertDialog` widget.

## [0.10.6] - 16-07-2024
### Changed
- Make `scrollController` property required in `ElevarmDataTable` widget.
- Make all CHANGELOGs linkable.

## [0.10.5] - 27-05-2024
### Added
- `child` param in `ElevarmImagePreviewDialog` component widget.
- `ElevarmAppLoaderOverlay` component widget.
- `isTabExpanded` & `isTabScrollable` params in `ElevarmTabBar` component widget.
- `ElevarmPrimaryTabBar` component widget.
- `ElevarmBreadcrumb` component widget.
- `ElevarmDataTable` advanced component widget.

## [0.10.4] - 16-04-2024
### Added
- `ElevarmRadioButtonTheme` class for theming radio button.

### Changed
- `ElevarmConfirmAlertDialog.show` method return type to `Future<T?>`.

### Fixed
- Bitbucket Pipelines image version.

## [0.10.3] - 29-02-2024
### Fixed
- `ElevarmSnackBar` is clipped on Android.
- `ElevarmDesktopPaginationFooter` for few buttons.

## [0.10.2] - 22-02-2024
### Added
- `sliverPersistentHeaderDelegate` parameter to `ElevarmDraggableBottomSheet`.
- `suffixAddOnText` parameter to `ElevarmTextInputField`.
- `key` property in `ElevarmBottomNavigationBarItem`.

### Changed
- Update deployment scripts after git hooks activated.

### Fixed
- Unable to load font licenses.

## [0.10.1] - 31-01-2024
### Added
- `collection_methods_unrelated_type`, `dangling_library_doc_comments`, `implicit_call_tearoffs`, `library_annotations`, `unnecessary_library_directive`, `unnecessary_null_aware_operator_on_extension_on_nullable`, `unnecessary_to_list_in_spreads`, `unreachable_from_main`, and `use_string_in_part_of_directives` linting rules.
- mason for `elevarm_common_tools`.
- `bitbucket-pipelines.yml` for `osv-scanner`.
- `ElevarmReadMoreContainer` component widget.

## [0.10.0] - 18-01-2024
### Added
- `always_use_package_imports`, `annotate_redeclares`, `combinators_ordering`, `directives_ordering`, `no_self_assignments`, `no_wildcard_variable_uses`, `sort_child_properties_last`, `sort_pub_dependencies`, `sort_unnamed_constructors_first` linting rules.
- `ElevarmFilledIcon` component widget.
- `ElevarmMenuCard` component widget.
- `ElevarmMenuCard` component's `text` variant.
- `ElevarmSwitchListTile` component widget.
- `dotColor` parameter to `ElevarmTag` widget.
- `ElevarmViewDetailCard` component's `secondary` variant.
- `leadingIconSize` and `trailingIconSize` parameters to `ElevarmViewDetailCard` component.
- `size` and `maxWidth` parameters to `ElevarmConfirmAlertDialog` component.
- `ElevarmThumbnailList` component widget.
- `iconColor` and `badge` parameters to `ElevarmBottomNavigationBarItem` component.
- `ElevarmAppBarSearchAndAction` component widget.
- `always_declare_return_types`, `always_put_required_named_parameters_first`, `avoid_bool_literals_in_conditional_expressions`, `invalid_case_patterns`, `matching_super_parameters`, `no_literal_bool_comparisons`, `type_literal_in_constant_pattern`, `unnecessary_breaks` linting rules.
- `elevation` parameter to `ElevarmAppBarSearchAndAction`.

### Changed
- Bump `dart_pre_commit` version to 5.2.0.
- Bump `elevarm_icons` version to 1.1.1.

## [0.9.4] - 03-01-2024
### Added
- Vertical padding to `ElevarmRadioButton` with text.

## [0.9.3] - 28-12-2023
### Added
- `dialogTheme`, `cardTheme`, `popupMenuTheme` to `ElevarmThemeData.light`.

### Changed
- Set `useMaterial3` to false for `ElevarmThemeData.light`.

## [0.9.2] - 20-12-2023
### Added
- `errorBuilder` property in `ElevarmTypeAheadInputField` component.

### Changed
- Bump `syncfusion_flutter_charts` version to 23.1.44.
- Bump `syncfusion_flutter_datepicker` version to 23.1.44.

### Removed
- Figma links in Readme.

### Fixed
- `dividerTheme` & `scaffoldBackgroundColor` values that change after Flutter upgrade.

## [0.9.1] - 28-11-2023
### Added
- `ElevarmTypeAheadInputField` component class.

## [0.9.0] - 28-11-2023
### Changed
- Bump `elevarm_icons` version to 1.0.0.
- `ElevarmIcon` widget signature.
- Change all iconAssetName parameter types to `IconData`.

## [0.8.1] - 17-11-2023
### Added
- More variants for `ElevarmConfirmAlertDialog`.
- `info` variant to Elevarm Badge widgets.

### Fixed
- Text overflow in `ElevarmCheckbox`.
- Make `text` not required in `ElevarmAlert` component.

## [0.8.0] - 24-10-2023
### Added
- `ElevarmViewDetailCard` component class.
- `ElevarmIconRipple`'s `variant` property.

### Changed
- Change Elevarm buttons' theme overloading to prioritize `buttonTheme` parameter than global theme inheritance.

### Deprecated
- Color properties in `ElevarmIconRipple`.

## [0.7.7] - 06-10-2023
### Changed
- Bump elevarm_icons version to `^0.5.0`

## [0.7.6] - 02-10-2023
### Changed
- Bump elevarm_icons version to `^0.4.0`

## [0.7.5] - 27-09-2023
### Fixed
- Background color `ElevarmFileUploadCard` to white

## [0.7.4] - 26-09-2023
### Added
- `controller` parameter in `ElevarmDropdownInputField` component widget.

## [0.7.3] - 19-09-2023
### Changed
- Refactor `ElevarmStackedHorizontalBarChartCard` to `ElevarmStackedHorizontalBarChart`.
- Refactor `ElevarmLineChartCard` to `ElevarmLineChart`.

### Deprecated
- `ElevarmStackedHorizontalBarChartCard` widget.
- `ElevarmLineChartCard` widget.

## [0.7.2] - 06-09-2023
### Changed
- Revert `ElevarmDropdownInputField` changes.

## [0.7.1] - 04-09-2023
### Added
- `iconAssetName` property to `ElevarmConfirmAlertDialog` component widget.

## [0.7.0] - 04-09-2023
### Added
- `setInitialValue` method on `didUpdateWidget` in `ElevarmDropdownInputField` widget.
- View mode in `ElevarmFileUploadCard` widget.
- `ElevarmBottomNavigationBar` component class widget.
- `ElevarmButtonTheme` inherited widget class and `ElevarmButtonThemeData` theme data class.
- `ElevarmCheckboxTheme` inherited widget class and `ElevarmCheckboxThemeData` theme data class.
- Add `ElevarmInputFileColor` text color property.
- Black & White variants to `ElevarmLogo` widget.
- 4XL size of `ElevarmBoxShadow` class.
- `ElevarmBlur` theme class.
- `ElevarmTag` component widget.

### Changed
- Change input hint text error and text helper from 14px (Sm) to 12px (Xs).
- Change ElevarmTertiaryNeutralButton color from neutral400 to neutral500.
- Modify `ElevarmPrimaryButton` to use `ElevarmPrimaryButtonThemeData`.
- Modify `ElevarmSecondaryButton` to use `ElevarmSecondaryButtonThemeData`.
- Modify `ElevarmOutlineButton` to use `ElevarmOutlineButtonThemeData`.
- Modify `ElevarmLinkButton` to use `ElevarmLinkButtonThemeData`.
- Modify `ElevarmTertiaryButton` to use `ElevarmTertiaryButtonThemeData`.
- Modify `ElevarmCheckbox` to use `ElevarmCheckboxTheme`.
- Modify `ElevarmCheckboxListTile` to use `ElevarmCheckboxTheme`.
- Revamp `ElevarmFileUploadCard`.
- Change input hint text from 16px (Md) to 12px (Xs).
- Remove remainder(60)
- `ElevarmAlert` to newest design.

### Deprecated
- `isWhite` property in `ElevarmLogo` widget.

### Fixed
- `ElevarmCheckboxListTile` widget name.
- `ElevarmBoxShadow`'s switched X & Y offset.
- `ElevarmFilUploadCard` onTap and onTapAction are not working.

### Removed
- `timeago` library.

## [0.6.0] - 06-07-2023
### Added
- `ElevarmCheckBoxListTile` component class widget.
- `ElevarmImagePreviewDialog` component class widget.
- `ElevarmImagePreviewScreen` screen class widget.
- `ElevarmIconRipple` component class widget.
- `ElevarmDektopPaginationFooter` component class widget.


## [0.5.1] - 09-06-2023
### Changed
- Font asset from remote (`google_fonts`) to local to avoid font glitching.

### Fixed
- Dart 3 compatibility by upgrading `google_fonts` to `4.0.4`
- Font licenses path.

## [0.5.0] - 16-05-2023
### Added
- `ElevarmDraggableBottomSheet` bottom sheet class widget.
- `ElevarmRadioListTile` component class widget.
- Callback `ElevarmSelectDateRangeBottomSheetOption` in `showElevarmSelectDateRangeBottomSheet` and `ElevarmSelectDateRangeBottomSheet` widget.
- `LibraryTextStyles` class for library-scoped text styling.

### Fixed
- Stretched image on `ElevarmAvatar` if the provided image is not square.

## [0.4.0] - 08-05-2023
### Added
- `showElevarmSelectDateRangeBottomSheet` for displaying select date range bottom sheet.
- `ElevarmInputFileCard` component widget.

### Changed
- file contents in `analysis_options.yaml` to standardized file across Elevarm frontend projects

## [0.3.2] - 27-04-2023
### Added
- `dart_pre_commit` package for code formatting and linting.

### Changed
- `ElevarmBottomSheet`'s `title` and `onPressedClose` properties to be not required.
- UI icons to `elevarm_icons`.

### Removed
- `toolbarOptions` property in `ElevarmTextInputField` and `ElevarmTextDropdownInputField` widget.

### Fixed
- `ElevarmDatePickerDialog`'s reversed positive and negative button labels.

## [0.3.1] - 18-04-2023
### Added
- Callback `onTextChanged` in `ElevarmAutocompleteInputField` when `ElevarmTextInputField`'s value changed.

## [0.3.0] - 06-04-2023
### Added
- `ElevarmStepper` component widget class.
- `ElevarmConfirmAlertDialog` component widget class.

## [0.2.1] - 21-03-2023
### Added
- `neutral25` color (same with the deprecated `grey25`).

### Changed
- Callbacks in `ElevarmSnackBar` to include `AnimationController?`.

### Fixed
- Close icon path in `ElevarmSnackBarContent` widget.
- Typo in `ElevarmColors` deprecated message.

## [0.2.0] - 21-03-2023
### Added
- `showElevarmSnackBar` and `showElevarmSnackBarDesktop` methods for displaying SnackBars.
- `ElevarmInputFieldLabel` for labeling inputField

### Changed
- `flutter_svg` version to 2.0.3 to avoid conflict with `flutter_gen`.

## [0.1.0] - 16-03-2023
### Added
- `ElevarmPrimaryCard` component widget class.
- `ElevarmOutlinedCard` component widget class.
- `ElevarmNeutralCard` component widget class.
- `ElevarmElevatedCard` component widget class.

### Changed
- Refactor `positiveButtonLabel`, `negativeButtonLabel`, and `weekNames` from `ElevarmDatePickerDialog` component widget.

### Fixed
-  Set `counterText` to empty string in properties `ElevarmTextInputField` component widget.

## [0.0.1+20] - 10-03-2023
### Added
- `ElevarmAlert` component widget class.
- `ElevarmDatePickerDialog` capability to select year.
- `ElevarmFileUploadCard` component widget class.
- `ElevarmBottomSheet` component widget class.

### Changed
- Move screenshots to Firebase Cloud Storage.

### Fixed
- `ElevarmTertiaryNeutralButton` background color to transparent.

## [0.0.1+19] - 05-03-2023
### Fixed
- Increase `ElevarmTextInputField` & `ElevarmTextDropdownInputField` content padding again.

## 0.0.1+18
### Fixed
- Increase `ElevarmTextInputField` & `ElevarmTextDropdownInputField` content padding.

## [0.0.1+17] - 04-03-2023
### Added
- Added key identity for `ElevarmLinkNeutralButton`, `ElevarmLinkPrimaryButton`, `ElevarmOutlineButton`, `ElevarmPrimaryButton`,`ElevarmTertiaryNeutralButton`
- `ElevarmSecondaryButton` component widget class.
- `ElevarmTertiaryPrimaryButton` component widget class.
- `prefixText`, `prefixAddOnText`, and `prefixUseMastercard` properties in `ElevarmTextInputField` component widget.
- `dropdownShowTrailingIcon` and `dropdownEnabled` properties in `ElevarmTextDropdownInputField` component widget.
- `ElevarmSwitch` component widget class.

### Fixed
- Icon size of button component with 2XL size.

## [0.0.1+16] - 23-02-2023
### Fixed
- Downgrade `intl` package version to `^0.17.0` to avoid conflict in AgriMaps & AgriPOS

## [0.0.1+15] - 22-02-2023
### Added
- `showElevarmDatePickerDialog` for displaying date picker/date range picker dialog.
- `prefixIconAssetName` property in `ElevarmTextInputField`.

## [0.0.1+14] - 20-02-2023
### Added
- `ElevarmDrawer` make show profile optional
- `ElevarmDesktopDrawer` make show profile optional
- `customData` property in `ElevarmStackedHorizontalBarChartData`.
- `splineType` property in `ElevarmLineChartCard`.

### Changed
- `legendValueBuilder` type to `String Function(ElevarmStackedHorizontalBarChartData data)?`.
- Legend text in `ElevarmLineChartCard` to a custom one.

### Fixed
- Overflowed legend text in `ElevarmStackedHorizontalBarChartCard` widget class.

## [0.0.1+13] - 14-02-2023
### Added
- `ElevarmOtpField` advanced component widget class.
- `ElevarmLinkNeutralButton` component widget class.
- `ElevarmLinkPrimaryButton` component widget class.
- `ElevarmTextDropdownInputField` component widget class.
- `isRequired` property to `ElevarmTextInputField`, `ElevarmAutocompleteInputField`, and `ElevarmDropdownInputField`.
- `ElevarmAutocompleteInputField` component widget class (only Default variant).
- `ElevarmDropdownInputField` component widget class (only Default variant).

## [0.0.1+12] - 10-02-2023
### Added
- `ElevarmLogo` component widget class.
- `ElevarmTextInputField` component widget class (only Default variant).

### Changed
- Elevarm logo asset from PNG to SVG.

### Removed
- Unused properties in `ElevarmThemeData.light()`.

## [0.0.1+11] - 09-02-2023
### Added
- `ElevarmDonutChartCard` component widget class.
- `Elevarm404DesktopScreen` screen widget class.
- `ElevarmUnderConstructionDesktopScreen` screen widget class.
- `ElevarmErrorDesktopScreen` screen widget class.
- `ElevarmLineChartCard` component widget class.
- `ElevarmStackedHorizontalBarChartCard` component widget class.
- `ElevarmStackedVerticalBarChartCard` component widget class.
- `ElevarmPasswordStrength` component widget class.

### Changed
- Move `ElevarmLinearProgressIndicator` default properties to constructor.

### Fixed
- `ElevarmBaseBadge` BoxFit to scale down as to not stretching the container.
- Set `maximumLabelWidth` to zero for `ElevarmLineChartCard`'s Y axis.

## 0.0.1+10
### Added
- `ElevarmTabBar` component widget class.
- `ElevarmMobilePaginationFooter` advanced component widget class.
- `ElevarmRadioButton` component widget class.
- `StringUtils` utility class.
  
### Changed
- `ElevarmLinearProgressIndicator` component widget class to its own folder.
  
### Fixed
- Button's text alignment to center.
- `ElevarmDesktopDrawer`'s expand button position.

## [0.0.1+9] - 01-02-2023
### Added
- `ElevarmBoxShadow` theme class.
- `ElevarmTertiaryNeutralButton` component widget class.
- `ElevarmCheckbox` component widget class.
- `ElevarmDivider` widget component.

### Changed
- `ElevarmRoundedCorners` to `ElevarmBorderRadius`.
- `ElevarmElevatedButton` to `ElevarmPrimaryButton`.
- `ElevarmOutlinedButton` to `ElevarmOutlineButton`.

## [0.0.1+8] - 25-01-2023
### Added
- `ElevarmFilledBadge` component widget.
- `ElevarmOutlinedBadge` component widget.

### Removed
- `ElevarmBadge` component widget in favor of `ElevarmFilledBadge` and `ElevarmOutlinedBadge`.

## [0.0.1+7] - 24-01-2023
### Added
- `initialFontSize`, `emptyIconSize`, `onlineIndicatorSize`, and `verifiedTickSize` properties in `ElevarmAvatar` component widget.

## 0.0.1+6
### Fixed
- Missing `showHeaderLogo` in `ElevarmDrawer` widget.

## 0.0.1+5
### Added
- Add `ElevarmIcon` widget component.
- Add `ElevarmAvatar` widget component.
- Add `ElevarmDrawer` widget component.
- Add `ElevarmDesktopDrawer` widget component.

## 0.0.1+4
### Added
- Add `ElevarmBadge` widget component.
- Add `ElevarmLinearProgressIndicator` widget component.
- Add `ElevarmRoundedCorners` class.
- Add `ElevarmThemeData` class.
- More colors

## 0.0.1+3
### Changed
- Add `allowRuntimeFetching` property in `ElevarmFonts.init` method.

## 0.0.1+2
### Added
- `ElevarmFonts` class.
- `ElevarmFontSizes` class.
- `ElevarmFontWeights` class.

### Fixed
- `primary300` color to `#8995DC`.
  
## 0.0.1+1
### Added
- `ElevarmColorsExt` extension class.

## 0.0.1
### Added
- `ElevarmColors` class.

[Unreleased]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/dev%0Dv0.11.5
[0.11.5]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.5%0Dv0.11.4
[0.11.4]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.4%0Dv0.11.3
[0.11.3]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.3%0Dv0.11.2
[0.11.2]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.2%0Dv0.11.1
[0.11.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.1%0Dv0.11.0
[0.11.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.11.0%0Dv0.10.8
[0.10.8]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.8%0Dv0.10.7
[0.10.7]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.7%0Dv0.10.6
[0.10.6]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.6%0Dv0.10.5
[0.10.5]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.5%0Dv0.10.4
[0.10.4]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.4%0Dv0.10.3
[0.10.3]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.3%0Dv0.10.2
[0.10.2]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.2%0Dv0.10.1
[0.10.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.1%0Dv0.10.0
[0.10.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.10.0%0Dv0.9.4
[0.9.4]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.9.4%0Dv0.9.3
[0.9.3]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.9.3%0Dv0.9.2
[0.9.2]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.9.2%0Dv0.9.1
[0.9.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.9.1%0Dv0.9.0
[0.9.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.9.0%0Dv0.8.1
[0.8.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.8.1%0Dv0.8.0
[0.8.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.8.0%0Dv0.7.7
[0.7.7]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.7%0Dv0.7.6
[0.7.6]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.6%0Dv0.7.5
[0.7.5]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.5%0Dv0.7.4
[0.7.4]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.4%0Dv0.7.3
[0.7.3]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.3%0Dv0.7.2
[0.7.2]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.2%0Dv0.7.1
[0.7.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.1%0Dv0.7.0
[0.7.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.7.0%0Dv0.6.0
[0.5.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.5.1%0Dv0.5.0
[0.5.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.5.0%0Dv0.4.0
[0.4.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.4.0%0Dv0.3.2
[0.3.2]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.3.2%0Dv0.3.1
[0.3.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.3.1%0Dv0.3.0
[0.3.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.3.0%0Dv0.2.1
[0.2.1]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.2.1%0Dv0.2.0
[0.2.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.2.0%0Dv0.1.0
[0.1.0]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.1.0%0Dv0.0.1%2B20
[0.0.1+20]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B20%0Dv0.0.1%2B19
[0.0.1+19]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B19%0Dv0.0.1%2B17
[0.0.1+17]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B17%0Dv0.0.1%2B16
[0.0.1+16]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B16%0Dv0.0.1%2B15
[0.0.1+15]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B15%0Dv0.0.1%2B14
[0.0.1+14]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B14%0Dv0.0.1%2B13
[0.0.1+13]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B13%0Dv0.0.1%2B12
[0.0.1+12]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B12%0Dv0.0.1%2B11
[0.0.1+11]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B11%0Dv0.0.1%2B9
[0.0.1+9]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B9%0Dv0.0.1%2B8
[0.0.1+8]: https://bitbucket.org/elevarm/elevarm_ui/branches/compare/v0.0.1%2B8%0Dv0.0.1%2B7
[0.0.1+7]: https://bitbucket.org/elevarm/elevarm_ui/src/v0.0.1+7/

