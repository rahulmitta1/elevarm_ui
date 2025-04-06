[![Pub Version](https://img.shields.io/pub/v/elevarm_ui?color=blueviolet)](https://pub.dev/packages/elevarm_ui)

Elevarm design system for Flutter.

## Features

- Color: [`ElevarmColors`](#a-color)
- Typography:
  - Font Family: [`ElevarmFontFamilies`](#b1-font-family)
  - Font Weight: [`ElevarmFontWeights`](#b2-font-weight)
  - Font Size: [`ElevarmFontSizes`](#b3-font-size)
- Shape:
  - Border Radius: [`ElevarmBorderRadius`](#c1-border-radius)
- Shadow:
  - Box Shadow: [`ElevarmBoxShadow`](#d1-box-shadow)
  - Blur: [`ElevarmBlur`](#d2-blur)
- Component:
  - Alert: [`ElevarmAlert`](#ElevarmAlert)
  - App Bar:
    - App Bar with Search and Action: ['ElevarmAppBarSearchAndAction](#elevarmappbarsearchandaction)
  - Avatar: [`ElevarmAvatar`](#elevarmavatar)
  - Badge:
    - Filled Badge: [`ElevarmFilledBadge`](#elevarmfilledbadge)
    - Outlined Badge: [`ElevarmOutlinedBadge`](#elevarmoutlinedbadge)
  - Bottom Sheet 
    - Elevarm Bottom Sheet: [`ElevarmBottomSheet`](#elevarmbottomsheet)
    - Elevarm Draggable Bottom Sheet: [`ElevarmDraggableBottomSheet`](#elevarmdraggablebottomsheet)
  - Bottom Navigation Bar
    - Elevarm Bottom Navigation Bar: [`ElevarmBottomNavigationBar`](#elevarmnavigationbar)
  - Button:
    - Elevarm Button Theme: [`ElevarmButtonTheme`](#elevarmbuttontheme)
    - Outlined Button: [`ElevarmOutlineButton`](#elevarmoutlinebutton)
    - Link Neutral Button: [`ElevarmLinkNeutralButton`](#elevarmlinkneutralbutton)
    - Link Primary Button: [`ElevarmLinkPrimaryButton`](#elevarmlinkprimarybutton)
    - Primary Button: [`ElevarmPrimaryButton`](#elevarmprimarybutton)
    - Secondary Button: [`ElevarmSecondaryButton`](#elevarmsecondarybutton)
    - Tertiary Neutral Button: [`ElevarmTertiaryNeutralButton`](#elevarmtertiaryneutralbutton)
    - Tertiary Primary Button: [`ElevarmTertiaryPrimaryButton`](#elevarmtertiaryprimarybutton)
  - Card:
    - Elevated Card: [`ElevarmElevatedCard`](#elevarmelevatedcard)
    - File Upload Card: [`ElevarmFileUploadCard`](#elevarmfileuploadcard)
    - Input File Card: [`ElevarmInputFileCard`](#elevarminputfilecard)
    - Menu Card: [`ElevarmMenuCard`](#elevarmmenucard)
    - Neutral Card: [`ElevarmNeutralCard`](#elevarmneutralcard)
    - Outlined Card: [`ElevarmOutlinedCard`](#elevarmoutlinedcard)
    - Primary Card: [`ElevarmPrimaryCard`](#elevarmprimarycard)
    - View Detail Card: [`ElevarmViewDetailCard`](#elevarmviewdetailcard)
  - Chart:
    - Bar Chart: 
      - [`ElevarmStackedHorizontalBarChart`](#elevarmstackedhorizontalbarchart)
      - [`ElevarmStackedVerticalBarChartCard`](#elevarmstackedverticalbarchartcard)
    - Donut Chart: [`ElevarmDonutChartCard`](#elevarmdonutchartcard)
    - Line Chart: [`ElevarmLineChart`](#elevarmlinechart)
  - Checkbox: [`ElevarmCheckbox`](#elevarmcheckbox)
  - Container:
    - Read More Container: ['ElevarmReadMoreContainer``](#elevarmreadmorecontainer)
  - Dialog:
    - Confirm Alert Dialog: [`ElevarmConfirmAlertDialog`](#elevarmconfirmalertdialog)
    - Image Preview Dialog: [`ElevarmImagePreviewDialog`](#elevarm-image-preview-dialog)  
  - Divider: [`ElevarmDivider`](#elevarmdivider)
  - DatePicker: [`showElevarmDatePickerDialog`](#showelevarmdatepickerdialog)
  - Drawer:
    - Mobile Drawer: [`ElevarmDrawer`](#elevarmdrawer-and-elevarmdesktopdrawer)
    - Desktop Drawer: [`ElevarmDesktopDrawer`](#elevarmdrawer-and-elevarmdesktopdrawer)
  - Icon:
    - [`ElevarmFilledIcon`](#elevarmfilledicon)
    - [`ElevarmIcon`](#elevarmicon)
    - [`ElevarmIconRipple`](#elevarmiconripple)
  - Images:
    - [`ElevarmThumbnailList`](#elevarmthumbnaillist)
  - Input Fields:
    - Autocomplete Input Field: [`ElevarmAutocompleteInputField`](#elevarmautocompleteinputfield)
    - Dropdown Input Field: [`ElevarmDropdownInputField`](#elevarmdropdowninputfield)
    - Text Dropdown Input Field: [`ElevarmTextDropdownInputField`](#elevarmtextdropdowninputfield)
    - Text Input Field: [`ElevarmTextInputField`](#elevarmtextinputfield)
    - TypeAhead Input Field: [`ElevarmTypeAheadInputField`](#ElevarmTypeAheadInputField)
  - Linear Progress Indicator: [`ElevarmLinearProgressIndicator`](#elevarmlinearprogressindicator)
  - Loader: [`ElevarmAppLoaderOverlay`](#elevarmlogo)
  - Logo: [`ElevarmLogo`](#elevarmlogo)
  - Password Strength: [`ElevarmPasswordStrength`](#elevarmpasswordstrength)
  - Radio Button: [`ElevarmRadioButton`](#elevarmradiobutton)
  - Radio List Tile: [`ElevarmRadioListTile`](#elevarmradiolisttile)
  - Radio Two-Choice Card: [`ElevarmTwoChoiceRadioCard`](#elevarmtwochoiceradiocard)
  - Select Date Range Bottom Sheet: [`showElevarmSelectDateRangeBottomSheet`](#showelevarmselectdaterangebottomsheet)
  - SnackBar: [`showElevarmSnackBar` & `showElevarmSnackBarDesktop`](#showelevarmsnackbar-and-showelevarmsnackbardesktop)
  - Stepper: [`ElevarmStepper`](#elevarmstepper)
  - Switch:
    - [`ElevarmSwitch`](#elevarmswitch)
    - [`ElevarmSwitchListTile`](#elevarmswitchlisttile)
  - Tab Bar: [`ElevarmTabBar`](#elevarmtabbar)
  - Tag: [`ElevarmTag`](#elevarmtag)
- Advanced Component:
  - Table:
    - Pagination Footer:
      - Mobile Pagination Footer: [`ElevarmMobilePaginationFooter`](#elevarmmobilepaginationfooter)
      - Dektop Pagination Footer: [`ElevarmDektopPaginationFooter`](#elevarmdektoppaginationfooter)
  - OTP Field[`ElevarmOtpField`](#elevarmotpfield)
- Theme Data:
  - Light: [`ElevarmThemeData.light()`](#elevarmthemedatalight)
- Screens:
  - 404 Desktop Screen: [`Elevarm404DesktopScreen`](#Elevarm404DesktopScreen)
  - Under Construction Desktop Screen: [`ElevarmUnderConstructionDesktopScreen`](#ElevarmUnderConstructionDesktopScreen)
  - Error Desktop Screen: [`ElevarmErrorDesktopScreen`](#ElevarmErrorDesktopScreen)
  - Image Preview Screen: [`ElevarmImagePreviewScreen`](#elevarm-image-preview-screen)

## Getting started

1. Initialize font configurations by calling `ElevarmFontFamilies.init` method in main function:
   ```dart
   import 'package:elevarm_ui/elevarm_ui.dart';

   void main() {
       ElevarmFontFamilies.init(
            allowRuntimeFetching: true,
       );
   
       runApp(const MyApp());
   }
   ```
2. Set the app's theme by passing `ElevarmThemeData` in `MaterialApp`:
   ```dart
   import 'package:elevarm_ui/elevarm_ui.dart';

   MaterialApp(
      theme: ElevarmThemeData.light(),
   );
   ```
3. You're finished! Now you can start using `elevarm_ui` classes below.

## A. Color

Colors are located in `ElevarmColors` class.

### a.1. Neutral Colors

|                                                          | Shade | Color     |
| -------------------------------------------------------- | ----- | --------- |
| ![#FCFCFD](https://placehold.co/10x10/FCFCFD/FCFCFD.png) | 25    | `#FCFCFD` |
| ![#F3F4F5](https://placehold.co/10x10/F3F4F5/F3F4F5.png) | 50    | `#F3F4F5` |
| ![#E7E8EA](https://placehold.co/10x10/E7E8EA/E7E8EA.png) | 100   | `#E7E8EA` |
| ![#B1B4B9](https://placehold.co/10x10/B1B4B9/B1B4B9.png) | 200   | `#B1B4B9` |
| ![#7C8089](https://placehold.co/10x10/7C8089/7C8089.png) | 300   | `#7C8089` |
| ![#464C58](https://placehold.co/10x10/464C58/464C58.png) | 400   | `#464C58` |
| ![#101828](https://placehold.co/10x10/101828/101828.png) | 500   | `#101828` |

### a.2. Primary Colors

|                                                          | Shade         | Color     |
| -------------------------------------------------------- | ------------- | --------- |
| ![#EAECF9](https://placehold.co/10x10/EAECF9/EAECF9.png) | 100           | `#EAECF9` |
| ![#B9C0EA](https://placehold.co/10x10/B9C0EA/B9C0EA.png) | 200           | `#B9C0EA` |
| ![#8995DC](https://placehold.co/10x10/8995DC/8995DC.png) | 300           | `#8995DC` |
| ![#5869CD](https://placehold.co/10x10/5869CD/5869CD.png) | 400           | `#5869CD` |
| ![#283EBF](https://placehold.co/10x10/283EBF/283EBF.png) | 500 (Default) | `#283EBF` |
| ![#2235A4](https://placehold.co/10x10/2235A4/2235A4.png) | 600           | `#2235A4` |
| ![#1D2D8A](https://placehold.co/10x10/1D2D8A/1D2D8A.png) | 700           | `#1D2D8A` |
| ![#17246F](https://placehold.co/10x10/17246F/17246F.png) | 800           | `#17246F` |
| ![#121B54](https://placehold.co/10x10/121B54/121B54.png) | 900           | `#121B54` |

### a.3. Info Colors

|                                                          | Shade         | Color     |
| -------------------------------------------------------- | ------------- | --------- |
| ![#E6F1FC](https://placehold.co/10x10/E6F1FC/E6F1FC.png) | 100           | `#E6F1FC` |
| ![#ADD1F6](https://placehold.co/10x10/ADD1F6/ADD1F6.png) | 200           | `#ADD1F6` |
| ![#75B0EF](https://placehold.co/10x10/75B0EF/75B0EF.png) | 300           | `#75B0EF` |
| ![#3D90E9](https://placehold.co/10x10/3D90E9/3D90E9.png) | 400           | `#3D90E9` |
| ![#0470E2](https://placehold.co/10x10/0470E2/0470E2.png) | 500 (Default) | `#0470E2` |
| ![#0360C2](https://placehold.co/10x10/0360C2/0360C2.png) | 600           | `#0360C2` |
| ![#0351A3](https://placehold.co/10x10/0351A3/0351A3.png) | 700           | `#0351A3` |
| ![#024183](https://placehold.co/10x10/024183/024183.png) | 800           | `#024183` |
| ![#023163](https://placehold.co/10x10/023163/023163.png) | 900           | `#023163` |

### a.4. Success Colors

|                                                          | Shade         | Color     |
| -------------------------------------------------------- | ------------- | --------- |
| ![#ECFDF3](https://placehold.co/10x10/ECFDF3/ECFDF3.png) | 50            | `#ECFDF3` |
| ![#E9F7E7](https://placehold.co/10x10/E9F7E7/E9F7E7.png) | 100           | `#E9F7E7` |
| ![#B8E4B0](https://placehold.co/10x10/B8E4B0/B8E4B0.png) | 200           | `#B8E4B0` |
| ![#87D179](https://placehold.co/10x10/87D179/87D179.png) | 300           | `#87D179` |
| ![#55BF43](https://placehold.co/10x10/55BF43/55BF43.png) | 400           | `#55BF43` |
| ![#24AC0C](https://placehold.co/10x10/24AC0C/24AC0C.png) | 500 (Default) | `#24AC0C` |
| ![#1F940A](https://placehold.co/10x10/1F940A/1F940A.png) | 600           | `#1F940A` |
| ![#1A7C09](https://placehold.co/10x10/1A7C09/1A7C09.png) | 700           | `#1A7C09` |
| ![#156407](https://placehold.co/10x10/156407/156407.png) | 800           | `#156407` |
| ![#104C05](https://placehold.co/10x10/104C05/104C05.png) | 900           | `#104C05` |

### a.5. Warning Colors

|                                                          | Shade         | Color     |
| -------------------------------------------------------- | ------------- | --------- |
| ![#FFF7E6](https://placehold.co/10x10/FFF7E6/FFF7E6.png) | 100           | `#FFF7E6` |
| ![#FEE3AE](https://placehold.co/10x10/FEE3AE/FEE3AE.png) | 200           | `#FEE3AE` |
| ![#FDD077](https://placehold.co/10x10/FDD077/FDD077.png) | 300           | `#FDD077` |
| ![#FDBD3F](https://placehold.co/10x10/FDBD3F/FDBD3F.png) | 400           | `#FDBD3F` |
| ![#FCAA07](https://placehold.co/10x10/FCAA07/FCAA07.png) | 500 (Default) | `#FCAA07` |
| ![#D99206](https://placehold.co/10x10/D99206/D99206.png) | 600           | `#D99206` |
| ![#B57A05](https://placehold.co/10x10/B57A05/B57A05.png) | 700           | `#B57A05` |
| ![#926304](https://placehold.co/10x10/926304/926304.png) | 800           | `#926304` |
| ![#6F4B03](https://placehold.co/10x10/6F4B03/6F4B03.png) | 900           | `#6F4B03` |

### a.6. Danger Colors

|                                                          | Shade         | Color     |
| -------------------------------------------------------- | ------------- | --------- |
| ![#FEF3F2](https://placehold.co/10x10/FEF3F2/FEF3F2.png) | 50            | `#FEF3F2` |
| ![#FAEBEC](https://placehold.co/10x10/FAEBEC/FAEBEC.png) | 100           | `#FAEBEC` |
| ![#EFBDC0](https://placehold.co/10x10/EFBDC0/EFBDC0.png) | 200           | `#EFBDC0` |
| ![#E49094](https://placehold.co/10x10/E49094/E49094.png) | 300           | `#E49094` |
| ![#D86268](https://placehold.co/10x10/D86268/D86268.png) | 400           | `#D86268` |
| ![#CD353C](https://placehold.co/10x10/CD353C/CD353C.png) | 500 (Default) | `#CD353C` |
| ![#B02E34](https://placehold.co/10x10/B02E34/B02E34.png) | 600           | `#B02E34` |
| ![#94262B](https://placehold.co/10x10/94262B/94262B.png) | 700           | `#94262B` |
| ![#771F23](https://placehold.co/10x10/771F23/771F23.png) | 800           | `#771F23` |
| ![#5A171A](https://placehold.co/10x10/5A171A/5A171A.png) | 900           | `#5A171A` |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const primary = ElevarmColors.primary;
const success500 = ElevarmColors.success500;
```

## B. Typography

### b.1. Font Family

Font families are located in `ElevarmFontFamilies` class.

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmFontFamilies.init(); // Call this before `runApp`.
const poppins = ElevarmFontFamilies.poppins();
```

### b.2. Font Weight

Font weights are located in `ElevarmFontWeights` class.

| Name     | Weight |
| -------- | ------ |
| regular  | 400    |
| medium   | 500    |
| semibold | 600    |
| bold     | 700    |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const fontWeightBold = ElevarmFontWeights.bold;
```

### b.3. Font Size

Font sizes are located in `ElevarmFontSizes` class.

| Name | Size     |
| ---- | -------- |
| xl5  | 48.0 dip |
| xl4  | 36.0 dip |
| xl3  | 30.0 dip |
| xl2  | 24.0 dip |
| xl   | 20.0 dip |
| lg   | 18.0 dip |
| md   | 16.0 dip |
| sm   | 14.0 dip |
| xs   | 12.0 dip |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const fontSizeLg = ElevarmFontSizes.lg;
```

## C. Shape

### c.1. Border Radius

Border radiuses are located in `ElevarmBorderRadius` class.

| Name | Size     |
| ---- | -------- |
| xs   | 4.0 dip  |
| sm   | 8.0 dip  |
| md   | 12.0 dip |
| lg   | 16.0 dip |
| xl   | 20.0 dip |
| xl2  | 24.0 dip |
| xl3  | 32.0 dip |
| xl4  | 40.0 dip |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const borderRadiusXl = ElevarmBorderRadius.xl;
```

## D. Shadow

### d.1. Box Shadow

Box shadows are located in `ElevarmBoxShadow` class.

| Name | Shadow  (h-offset v-offset blur spread color)                                     |
| ---- | --------------------------------------------------------------------------------- |
| xs   | 0px 1px 2px 0px rgba(16, 24, 40, 0.05)                                            |
| sm   | 0px 1px 2px 0px rgba(16, 24, 40, 0.06) 0px 1px 3px 0px rgba(16, 24, 40, 0.1)      |
| md   | 0px 2px 4px -2px rgba(16, 24, 40, 0.06) 0px 4px 8px -2px rgba(16, 24, 40, 0.1)    |
| lg   | 0px 4px 6px -2px rgba(16, 24, 40, 0.03) 0px 12px 16px -4px rgba(16, 24, 40, 0.08) |
| xl   | 0px 8px 8px -4px rgba(16, 24, 40, 0.03) 0px 20px 24px -4px rgba(16, 24, 40, 0.08) |
| xl2  | 0px 24px 48px -12px rgba(16, 24, 40, 0.18)                                        |
| xl3  | 0px 32px 64px -12px rgba(16, 24, 40, 0.14)                                        |
| xl4  | 0px 6px 24px -12px rgba(16, 24, 40, 0.5)                                          |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const boxShadowXl = ElevarmBoxShadow.xl;
```

### d.2. Blur

| Theme         | Screenshot                                                                                                                                                                        |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmBlur` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fblur.png?alt=media&token=6f028584-552f-4b35-96eb-2f8bd81fa40c"  /> |

Blurs are located in `ElevarmBlur` class.

| Name | Blur value |
| ---- | ---------- |
| xs   | 8px        |
| sm   | 16px       |
| md   | 24px       |
| lg   | 40px       |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmBlur(
    blurColor: Colors.black.withOpacity(0.6),
    blur: ElevarmBlurSizes.xs,
    borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
    overlay: const Center(
        child: Text(
            'sm dark',
            style: TextStyle(
                color: Colors.white,
            ),
        ),
    ),
    child: const SizedBox(
        width: 390,
        height: 120,
    ),
)
```

## E. Components

### `ElevarmAlert`

| Component      | Screenshot                                                                                                                                                                             |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmAlert` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Falerts-2.png?alt=media&token=21707ad2-d340-4c94-92ff-4d09b67ace5cF"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmAlert(
    text: 'There was a problem with that action',
    subtitle: 'Lorem ipsum...',
    variant: ElevarmAlertVariant.info,
    onClose: () {},
    secondaryActionText: 'Dismiss',
    onPressedSecondaryAction: () {},
    primaryActionText: 'View changes',
    onPressedPrimaryAction: () {},
)
```

### `ElevarmAppBarSearchAndAction`

| Component                      | Screenshot                                                                                                                                                                                             |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmAppBarSearchAndAction` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fapp_bar_search_and_action.png?alt=media&token=426cd76e-d80b-4113-b92a-74cdde07643b"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

Scaffold(
    appBar: ElevarmAppBarSearchAndAction(
        context: context,
        searchHintText: 'Cari kebutuhan harian di sini ...',
        actionWidgets: const [],
        callbackSubmittingSearch: (keyword) {},
      ),
    );

// or

Scaffold(
    appBar: ElevarmAppBarSearchAndAction.shoppingCart(
        context: context,
        searchHintText: 'Cari kebutuhan harian di sini ...',
        badgeCount: 5,
        callbackPressingCartButton: () {},
      ),
    );
```

### `ElevarmConfirmAlertDialog`

| Component                             | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                        |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmConfirmAlertDialog` (mobile)  | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fconfirm_alert_dialog_basic.png?alt=media&token=cfe4d5bc-71e6-4ebf-a903-a27786f53fe4"  />  <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fconfirm_alert_dialog_danger.png?alt=media&token=fdffac7f-548a-489a-b26a-8933897bd37c"  /> |
| `ElevarmConfirmAlertDialog` (desktop) | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fconfirm_alert_dialog_desktop.png?alt=media&token=5466a509-048a-481e-922c-9cb078cfec54"  />                                                                                                                                                                                                         |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Normal  dialog.
ElevarmPrimaryButton.text(
    text: 'Show Dialog',
    onPressed: () {
        ElevarmConfirmAlertDialog(
        title: 'Confirmation Dialog',
        subtitle: 'subtitle',
        onPositiveButton: () {},
        onNegativeButton: () {},
        positiveText: 'positiveText',
        negativeText: 'negativeText',
        variant: ElevarmDialogVariant.basic
        ).show(context);
    },
)
/// Dialog danger.
ElevarmPrimaryButton.text(
    text: 'Show Dialog',
    onPressed: () {
        ElevarmConfirmAlertDialog(
        title: 'Confirmation Dialog',
        subtitle: 'subtitle',
        onPositiveButton: () {},
        onNegativeButton: () {},
        positiveText: 'positiveText',
        negativeText: 'negativeText',
        variant: ElevarmDialogVariant.danger
        ).show(context);
    },
)
```

### `ElevarmAutocompleteInputField`

| Component                       | Screenshot                                                                                                                                                                                             |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmAutocompleteInputField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fautocomplete-input-fields.png?alt=media&token=18b01457-2853-4717-88d5-5fc37a56eeea"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmAutocompleteInputField<String>(
    label: 'Team Member',
    hintText: 'Select team member',
    helperText: 'This is a hint text to help user.',
    onChanged: (value) {},
    options: [
        ElevarmAutocompleteInputFieldOption(
            title: 'Phoenix Baker',
            subtitle: '@phoenix',
            value: 'Phoenix Baker',
        ),
        ElevarmAutocompleteInputFieldOption(
            title: 'Olivia Rhye',
            subtitle: '@olivia',
            value: 'Olivia Rhye',
        ),
    ],
)
```

### `ElevarmAvatar`

| Component       | Screenshot                                                                                                                                                                                       |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmAvatar` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Favatars.png?alt=media&token=dedf3b94-8632-4857-a181-a876acbab568" height="200" /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Avatar with initial.
const ElevarmAvatar(
    initial: 'OR',
)
/// Avatar with ImageProvider.
const ElevarmAvatar(
    image: const NetworkImage(
        'https://robohash.org/mail@ashallendesign.co.uk'
    ),
)
/// Avatar with custom size.
const ElevarmAvatar(
    size: ElevarmAvatarSizes.sm,
)
/// Avatar with online indicator.
const ElevarmAvatar(
    showOnlineIndicator: true,
)
/// Avatar with verified tick.
const ElevarmAvatar(
    showVerifiedTick: true,
)
```
### `ElevarmBottomSheet`

| Component            | Screenshot                                                                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmBottomSheet` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fbottom_sheets.png?alt=media&token=497d4624-ccf0-4ce3-b83f-ddf4e0d7c8d4"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmBottomSheet(
    initialChildSize: 0.65,
    title: 'Perhatian',
    onPressedClose: () {},
    children: [
        Text('Agar proses lelang berjalan lancar, mohon cek kembali daftar setoran bersih. Pastikan semua komoditas sudah terdata dengan baik.',
            textAlign: TextAlign.left,
            style: ElevarmFontFamilies.inter(
            color: ElevarmColors.neutral300,
            fontSize: ElevarmFontSizes.sm,
            fontWeight: ElevarmFontWeights.regular,
            ),
        ),
        const SizedBox(height: 30),
        SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevarmOutlineButton.text(
            text: 'Lihat Setoran Bersih',
            onPressed: () {},
            ),
        ),
        const SizedBox(height: 12),
        SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevarmPrimaryButton.icon(
            text: 'Lanjutkan',
            onPressed: () {},
            trailingIconAssetName: ElevarmIconsOutline.arrowRight,
            leadingIconAssetName: null,
            )
        ),
    ]
);
```

### `ElevarmBottomNavigationBar`

| Component                    | Screenshot                                                                                                                                                                                            |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmBottomNavigationBar` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fbottom_navigation_bar_v2.png?alt=media&token=d1515743-3eaa-4b7f-a48d-e53af1a89f00"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

Widget body = Container();
if (_currentTabIndex == 0) {
  body = _buildHomeScreen(context);
}

return Scaffold(
  appbar: AppBar,
  body: body,
  bottomNavigationBar: ElevarmBottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          ElevarmBottomNavigationBarItem(
            labelText: 'Beranda',
            iconAssetName: ElevarmIconsOutline.home02,
            iconColor: ElevarmColors.primary500,
          ),
          ElevarmBottomNavigationBarItem(
            labelText: 'Pembelanjaan',
            iconAssetName: ElevarmIconsOutline.shoppingCart01,
            badge: Container(
              height: 16,
              width: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ElevarmColors.danger,
              ),
              child: Center(
                child: Text(
                  '5',
                  style: ElevarmFontFamilies.inter(
                    fontSize: 10,
                    color: ElevarmColors.white,
                    fontWeight: ElevarmFontWeights.semibold,
                  ),
                ),
              ),
            ),
            iconColor: ElevarmColors.primary500,
          ),
          ElevarmBottomNavigationBarItem(
            labelText: 'Penjualan',
            iconAssetName: ElevarmIconsOutline.coinsSwap01,
            iconColor: ElevarmColors.primary500,
          ),
          ElevarmBottomNavigationBarItem(
            labelText: 'Akun',
            iconAssetName: ElevarmIconsOutline.user01,
            iconColor: ElevarmColors.primary500,
          ),
        ],
    ),
);
```

### `ElevarmButtonTheme`

| Component            | Screenshot                                                                                                                                                                                     |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmButtonTheme` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Felevarm_button_theme.png?alt=media&token=deb6140f-285e-4163-9f3c-b1a2063cf0fd"> |


```dart
/// Theme for buttons (base)
const greenButtonThemeData = ElevarmButtonThemeData(
    primaryColor: green500,
    disabledColor: green200,
    hoverColor: green600,
    focusColor: green500,
);

/// Theme for primary button
const greenPrimaryButtonThemeData = ElevarmPrimaryButtonThemeData(
    primaryColor: green500,
    disabledColor: green200,
    hoverColor: green600,
    focusColor: green500,
);

/// Directly set theme to button
AppPrimaryButton.text(
    text: 'Dummy Alt Button',
    buttonThemeData: greenPrimaryButtonThemeData,
    onPressed: () {},
),

/// or Wrap with [ElevarmButtonTheme] to provide theme to all primary buttons in tree
ElevarmButtonTheme(
    primaryButtonThemeData: greenPrimaryButtonThemeData,
    child: Scaffold(),
);

```

### `ElevarmCheckbox`

| Component         | Screenshot                                                                                                                                                                              |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmCheckbox` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fcheckboxes.png?alt=media&token=869978ed-99e7-4dc6-b3d7-ef992d94d06f"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Checked or not.
ElevarmCheckbox(
    checked: false,
    onPressed: () {},
)
/// Indeterminate.
ElevarmCheckbox(
    checked: true,
    indeterminate: true,
    onPressed: () {},
)
/// With supporting texts.
ElevarmCheckbox(
    checked: false,
    onPressed: () {},
    title: 'Remember me',
    subtitle: 'Save my login details for next time.',
)
```

### `ElevarmCheckboxListTile`

| Component                 | Screenshot                                                                                                                                                                                                                                                                                                |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmCheckboxListTile` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fcheckbox-list-tile.png?alt=media&token=9ab15676-005c-4c49-b2a3-d7387546f02a&_gl=1*e868nj*_ga*MTgxNzg0NDc5OS4xNjc0MDIxMTE5*_ga_CW55HF8NVT*MTY4NjYzNzkxMi4xMy4xLjE2ODY2MzgwMzcuMC4wLjA."  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmCheckboxListTile(
    checked: false,
    onPressed: (){},
    title: '',
    subtitle: '',
    padding: const EdgeInsets.all(16.0),
    size: ElevarmCheckboxSize.sm,
    trailingWidget: Container(),
),
```

### `ElevarmCheckboxTheme`

| Component              | Screenshot                                                                                                                                                                                          |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmCheckboxTheme` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Felevarm_checkbox_theme.png?alt=media&token=f8c2294d-a1d1-47a6-8a84-d3081d37f4d9"  /> |

```dart

const greenCheckboxThemeData = ElevarmCheckboxThemeData(
    borderCheckedColor: green500,
    borderFocusedColor: green300,
    backgroundCheckedColor: green100,
    iconEnabledColor: green500,
);

/// Directly set theme to checkbox
ElevarmCheckbox(
    title: 'Dummy Checkbox 2',
    checked: checkboxChecked2,
    onPressed: () {
    setState(() {
        checkboxChecked2 = !checkboxChecked2;
    });
    },
    checkboxThemeData: greenCheckboxThemeData,
);

ElevarmCheckboxListTile(
    title: 'Dummy Checkbox 2',
    checked: checkboxChecked2,
    onPressed: () {
    setState(() {
        checkboxChecked2 = !checkboxChecked2;
    });
    },
    checkboxThemeData: greenCheckboxThemeData,
);

/// or Wrap with [ElevarmCheckboxTheme] to provide theme to all checkbox in tree
ElevarmCheckboxTheme(
    checkboxThemeData: greenCheckboxThemeData,
    child: Scaffold(),
);

```

### `ElevarmReadMoreContainer`

| Component                  | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                        |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmReadMoreContainer` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fread-more-container-shrunk.jpg?alt=media&token=3f415b78-0d4d-4893-b1a3-84408bcec54c"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fread-more-container-expanded.jpg?alt=media&token=3b8ef946-cf59-4025-8931-5b0b52f4ec5f"  /> |


```dart
import 'package:elevarm_ui/elevarm_ui.dart';

 ElevarmReadMoreContainer(
    buttonThemeData: const ElevarmLinkButtonThemeData(onPrimaryColor: green500),
    content: description, // can be markdown text
    minHeight: 60,
    maxHeight: 200,
),
```

### `ElevarmDivider`

| Component        | Screenshot                                                                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDivider` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdividers.png?alt=media&token=244d2d92-1388-4780-85d7-676e19d78dba"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Normal  divider.
ElevarmDivider()
/// With middle content.
ElevarmDivider(
    child: Text('With Text'),
)
```

### `ElevarmDonutChartCard`

| Component               | Screenshot                                                                                                                                                                                     |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDonutChartCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdonut-chart-cards.png?alt=media&token=c02f21e3-1f85-4052-b0b4-a43cabdcc088"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmDonutChartCard(
    title: 'Kepemilikan Lahan',
    subtitle: 'Terakhir diperbarui 30/11/2021 - 09.30 WIB',
    dataSource: [
        ElevarmDonutChartData(
            label: 'Sewa',
            value: 2000,
            color: ElevarmColors.success,
        ),
        ElevarmDonutChartData(
            label: 'Milik Sendiri',
            value: 1000,
            color: ElevarmColors.primary600,
        ),
    ],
)
```

### `ElevarmDrawer` and `ElevarmDesktopDrawer`

| Component                         | Screenshot                                                                                                                                                                                                       |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDesktopDrawer` (expanded) | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdrawer-desktop-expanded.png?alt=media&token=a07282a9-cff1-498e-9400-c72ebd363577" height="200" /> |
| `ElevarmDesktopDrawer` (shrunk)   | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdrawer-desktop-shrunk.png?alt=media&token=0ec661a2-a875-4736-b324-47de4f097a48" height="200" />   |
| `ElevarmDrawer`                   | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdrawer-mobile.png?alt=media&token=1e42925d-8f03-435d-8d42-2121dcafc98a" height="200" />           |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:go_router/go_router.dart';

/// Drawer for mobile
const ElevarmDrawer(
    currentRoutePath: '/dashboard',
    onChangedRoutePath: (context, String? routePath) {
        if (routePath != null) {
            context.go(routePath);
        }
    },
    profileTitle: 'Olivia Rhye',
    profileSubtitle: 'olivia@untitledui.com',
    onPressedLogout: (context) {},
    headerTitle: Text('AgriMaps'),
    headerSubtitle: Text('DASHBOARD'),
    mainMenus: [], /// List<ElevarmDrawerMenu>
    secondaryMenus: [], /// List<ElevarmDrawerMenu>
)
/// Drawer for desktop
const ElevarmDesktopDrawer(
    currentRoutePath: '/dashboard',
    onChangedRoutePath: (context, String? routePath) {
        if (routePath != null) {
            context.go(routePath);
        }
    },
    profileTitle: 'Olivia Rhye',
    profileSubtitle: 'olivia@untitledui.com',
    onPressedLogout: (context) {},
    headerTitle: Text('AgriMaps'),
    headerSubtitle: Text('DASHBOARD'),
    mainMenus: [], /// List<ElevarmDrawerMenu>
    secondaryMenus: [], /// List<ElevarmDrawerMenu>
    child: Text('Drawer content'),
)
```

### `ElevarmDraggableBottomSheet`
| Component                     | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                       |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDraggableBottomSheet` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdraggable-bottom-sheet.png?alt=media&token=43c19bc2-bbf3-408e-b6f6-6b1840db8da6"  />  <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdraggable-bottom-sheet-subtitle.png?alt=media&token=210e8e18-a042-4309-bbba-3a9f37555da7" /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

final double deviceHeight = MediaQuery.of(context).size.height;
final double height = 460 / deviceHeight; // height based on ratio of widget's height and device's height
return ElevarmDraggableBottomSheet(
    title: 'Pilih Rekening',
    initialChildSize: height,
    maxChildSize: height, // set maxChildSize to same as initialChildSize if you want your bottom sheet to have exact height/wrap content
    onPressedClose: widget.onPressedClose,
    footerWidget: ElevarmPrimaryButton.text(
        text: 'Simpan & Tutup',
        height: ElevarmButtonHeights.lg,
        onPressed: _selectedAccount == null
            ? null
            : () => widget.onPressedSelect(_selectedAccount!),
    ),
    children: bankAccountDummies
        .mapIndexed(
        (index, data) => _buildBankAccountItem(
            data,
            index == bankAccountDummies.length - 1,
        ),
        )
        .toList(),
);
```

### `ElevarmDropdownInputField`

| Component                   | Screenshot                                                                                                                                                                                         |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDropdownInputField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdropdown-input-fields.png?alt=media&token=32916604-61e7-4080-a8c7-d8bb243a39f5"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmDropdownInputField<String>(
    label: 'Team Member',
    hintText: 'Select team member',
    helperText: 'This is a hint text to help user.',
    onChanged: (value) {},
    options: [
        ElevarmDropdownInputFieldOption(
            title: 'Phoenix Baker',
            subtitle: '@phoenix',
            value: 'Phoenix Baker',
        ),
        ElevarmDropdownInputFieldOption(
            title: 'Olivia Rhye',
            subtitle: '@olivia',
            value: 'Olivia Rhye',
        ),
    ],
)
```

### `ElevarmElevatedCard`

| Component             | Screenshot                                                                                                                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmElevatedCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Felevated_cards.png?alt=media&token=f6fb4dff-965e-4252-9eb3-3382e2e7f21f"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmElevatedCard(
    child: Column(
        children: [
            Row(
                children: [
                    Text('Varietas',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral300,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    ),
                    const Spacer(),
                    Text('Varietas A',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral500,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    )
                ],
            ),
           
        ],
    ),
),
```

### `ElevarmFileUploadCard`

| Component               | Screenshot                                                                                                                                                                                         |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmFileUploadCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ffile_upload_cards.png?alt=media&token=c0dadad4-5a2c-420b-b7d3-63d3aa454a18"  />     |
|                         | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ffile_upload_card_view.png?alt=media&token=2bce791b-61af-4457-91a0-6f301bc8a85e"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// With Progress Indicator
ElevarmFileUploadCard(
    title: 'Pembayaran.png',
    subtitle: '$filesize - $timestamp'
    actionIconAssetName: ElevarmIconsOutline.delete,
    loadingProgress: 1,
    isLoading: true,
    onTap: () {},
    onTapAction: () {},
),
/// Without Progress Indicator
ElevarmFileUploadCard(
    title: 'Pembayaran.png',
    subtitle: '$filesize - $timestamp'
    actionIconAssetName: ElevarmIconsOutline.eye,
    onTap: () {},
    onTapAction: () {},
),

```

### `ElevarmInputFileCard`

| Component              | Screenshot                                                                                                                                                                                   |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmInputFileCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Finput-file-card.png?alt=media&token=44cf7bf3-03c5-4e6c-b0e4-e5341a24be62"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmInputFileCard(
    onTap: () {},
    clickToUploadLabel: 'Klik untuk unggah',
    orDragAndDropLabel: ' atau seret dan lepas',
    subtitle: 'PNG, JPG, JPEG (maks. 800x400px)',
)
```

### `ElevarmFilledBadge`

| Component            | Screenshot                                                                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmFilledBadge` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ffilled-badges.png?alt=media&token=75a4cadf-ba0e-4c9d-9daa-9345c140982a"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// With text only.
ElevarmFilledBadge.text(
    'Label',
)
/// With text and dot.
ElevarmFilledBadge.dot(
    'Label',
)
/// With text and avatar.
ElevarmFilledBadge.avatar(
    'Label',
    const ElevarmAvatar(
        image: const NetworkImage('https://robohash.org/mail@ashallendesign.co.uk'),
    ),
)
/// With text and cancel icon.
ElevarmFilledBadge.cancel(
    'Label',
)
/// With icon only.
ElevarmFilledBadge.iconOnly(
    ElevarmIconsOutline.user01,
)
```

### `ElevarmFilledIcon`

| Component           | Screenshot                                                                                                                                                                               |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmFilledIcon` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ffilled_icon.png?alt=media&token=182fb7a2-d077-4ac2-8a4e-66f0411da758"  /> |

```dart
import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';

const ElevarmFilledIcon(
    icon: ElevarmIconsOutline.package,
    iconSize: 24.0,
    variant: ElevarmFilledIconVariant.danger,
)
```

### `ElevarmIcon`

| Component     | Screenshot                                                                                                                                                                         |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmIcon` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ficons.png?alt=media&token=e98a555a-44cc-4f4c-af39-effd44503044"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const ElevarmIcon(
    ElevarmIconsOutline.user01,
)
```

### `ElevarmImagePreviewDialog` and `ElevarmImagePreviewScreen`

| Component                   | Screenshot                                                                                                                                                                               |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmImagePreviewDialog` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fimage-dialog.png?alt=media&token=cb0f24e8-4b06-4d2f-960f-6c0f07a59079"/>  |
| `ElevarmImagePreviewScreen` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fimage-screen.png?alt=media&token=3544cf6b-d2ae-4f36-8c59-7e353fa67872" /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmImagePreviewDialog(
    imageUrl: 'https://picsum.photos/200',
    onPressedClose: () {
        Navigator.of(context).pop();
    },
    onPressedFullscreen: () {
        GoRouter.of(context).push(
            '/component/preview/image',
            extra: 'https://picsum.photos/200',
        );
    },
    title: 'Image Preview',
).show(context);
```

### `ElevarmLinearProgressIndicator`

| Component                        | Screenshot                                                                                                                                                                                             |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmLinearProgressIndicator` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Flinear-progress-indicator.png?alt=media&token=d20bc0ff-7f3c-48ba-aa47-cd651f56f764"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const ElevarmLinearProgressIndicator(
    value: 0.5,
)
```

### `ElevarmLogo`

| Component     | Screenshot                                                                                                                                                                           |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmLogo` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Flogos-2.png?alt=media&token=0585b1ab-d9e1-4cfa-8cfe-cb2811a8bdd8"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Colorful variant.
const ElevarmLogo(
    variant: ElevarmLogoVariant.colorful,
)

/// White Green variant.
const ElevarmLogo(
    variant: ElevarmLogoVariant.whiteGreen,
)

/// White variant.
const ElevarmLogo(
    variant: ElevarmLogoVariant.white,
)

/// Black variant.
const ElevarmLogo(
    variant: ElevarmLogoVariant.black,
)
```

### `ElevarmAppLoaderOverlay`

| Component                 | Screenshot |
| ------------------------- | ---------- |
| `ElevarmAppLoaderOverlay` | N/A        |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

const ElevarmAppLoaderOverlay(
    title: 'Memuat halaman...',
    titleColor: ElevarmColors.primary,
    progressIndicatorColor: ElevarmColors.primary,
    progressIndicatorColor: ElevarmColors.primary,
)
```

### `ElevarmLineChart`

| Component          | Screenshot                                                                                                                                                                              |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmLineChart` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fline-chart.png?alt=media&token=63439963-0221-439d-b7cf-be76daf531d8"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmOutlinedCard(
    child: ElevarmLineChart(
        splineType: ElevarmLineChartSplineType.natural,
        dataSource: [
            ElevarmLineChartDataSeries(
                label: 'Sewa',
                color: ElevarmColors.success,
                dataPoints: [
                    ElevarmLineChartData(
                    label: 'Jan',
                    value: 10,
                    ),
                    ElevarmLineChartData(
                    label: 'Feb',
                    value: 15,
                    ),
                ],
            ),
        ],
    )
)
  
```

### `ElevarmLinkNeutralButton`

| Component                  | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmLinkNeutralButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Flink-neutral-buttons.png?alt=media&token=44e12498-666b-4b7d-bd25-5555de467aaa"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Flink-neutral-buttons-destructive.png?alt=media&token=af981302-eed6-46e8-b4f0-ee6a1309a7b6"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmLinkNeutralButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmLinkNeutralButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmLinkNeutralButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmLinkPrimaryButton`

| Component                  | Screenshot                                                                                                                                                                                        |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmLinkPrimaryButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Flink-primary-buttons.png?alt=media&token=87914bfc-6b0e-4d1b-a929-56b493c46ed7"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmLinkPrimaryButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmLinkPrimaryButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmLinkPrimaryButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmMenuCard`

| Component                            | Screenshot                                                                                                                                                                                  |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmMenuCard` (elevated variant) | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fmenu_card.png?alt=media&token=779f9a68-1be9-438b-9d6b-8707fd27bb20"  />      |
| `ElevarmMenuCard` (text variant)     | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fmenu_card_text.png?alt=media&token=bfe88c23-0b5a-4dd8-b1c5-8c46f4c8fb24"  /> |

```dart
import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmMenuCard(
    title: 'Setoran Kotor',
    subtitle: 'Biaya pengemasan',
    iconVariant: ElevarmFilledIconVariant.danger,
    icon: ElevarmIconsOutline.download_04,
    variant: ElevarmMenuCardVariant.elevated,
    onTap: () {},
)
```

### `ElevarmNeutralCard`

| Component            | Screenshot                                                                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmNeutralCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fneutral_cards.png?alt=media&token=3a65b5a0-01a3-4061-87e3-2206d6100bce"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmNeutralCard(
    child: Column(
        children: [
            Row(
                children: [
                    Text('Varietas',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral300,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    ),
                    const Spacer(),
                    Text('Varietas A',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral500,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    )
                ],
            ),
           
        ],
    ),
),
```

### `ElevarmOutlinedBadge`

| Component              | Screenshot                                                                                                                                                                                   |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmOutlinedBadge` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Foutlined-badges.png?alt=media&token=8ee4cb37-92ba-4777-b8c1-e774e3bf49b8"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// With text only.
ElevarmOutlinedBadge.text(
    'Label',
)
/// With text and dot.
ElevarmOutlinedBadge.dot(
    'Label',
)
/// With text and avatar.
ElevarmOutlinedBadge.avatar(
    'Label',
    const ElevarmAvatar(
        image: const NetworkImage('https://robohash.org/mail@ashallendesign.co.uk'),
    ),
)
/// With text and cancel icon.
ElevarmOutlinedBadge.cancel(
    'Label',
)
/// With icon only.
ElevarmOutlinedBadge.iconOnly(
    ElevarmIconsOutline.user01,
)
```

### `ElevarmOutlineButton`

| Component              | Screenshot                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmOutlineButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Foutline-buttons.png?alt=media&token=789e1856-100c-40cb-a5a7-d177f6e35a61"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Foutline-buttons-destructive.png?alt=media&token=e0ef8c74-e456-422e-8f5f-432ae7c9ce1a"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmOutlineButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmOutlineButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmOutlineButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmOutlinedCard`

| Component             | Screenshot                                                                                                                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmOutlinedCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Foutlined_cards.png?alt=media&token=1d71ae62-19e5-4e9e-97d4-1ff4d61e2549"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmOutlinedCard(
    child: Column(
        children: [
            Row(
                children: [
                    Text('Varietas',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral300,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    ),
                    const Spacer(),
                    Text('Varietas A',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral500,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    )
                ],
            ),
           
        ],
    ),
),
```

### `ElevarmPasswordStrength`

| Component                 | Screenshot                                                                                                                                                                                      |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmPasswordStrength` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fpassword-strengths.png?alt=media&token=a42069e5-0000-4429-afba-a87debbd7a29"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// With default validations.
ElevarmPasswordStrength(
    password: _inputPassword,
    validations: ElevarmPasswordStrengthValidation.getDefaults(),
)
/// With custom validations.
ElevarmPasswordStrength(
    title: 'Custom Password Validation:',
    password: _inputPassword,
    validations: [
        ElevarmPasswordStrengthValidation(
            label: 'Harus mengandung kata "Hehe"',
            validate: (password) => password.contains("Hehe"),
        ),
    ],
)
```

### `ElevarmPrimaryButton`

| Component              | Screenshot                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmPrimaryButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fprimary-buttons.png?alt=media&token=451ed3d4-1db8-4c7d-836a-51f13506d8b8"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fprimary-buttons-destructive.png?alt=media&token=6310a73d-3f96-4425-b0f3-9e28a8c6e8d9"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmPrimaryButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmPrimaryButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmPrimaryButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmPrimaryCard`

| Component            | Screenshot                                                                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ElevarmPrimaryCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fprimary_cards.png?alt=media&token=5b386dbc-f646-44f1-b366-589251bf55c0"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmPrimaryCard(
    child: Column(
        children: [
            Row(
                children: [
                    Text('Varietas',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral300,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    ),
                    const Spacer(),
                    Text('Varietas A',
                        textAlign: TextAlign.left,
                        style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral500,
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        ),
                    )
                ],
            ),
           
        ],
    ),
),
```

### `ElevarmViewDetailCard`

| Component               | Screenshot                                                                                                                                                                                            |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmViewDetailCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Felevarm-view-detail-card.png?alt=media&token=ab08b5ae-e40f-46a0-888c-e63754a307df"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmViewDetailCard(
    leadingIconAssetName: ElevarmIconsOutline.receiptCheck,
    title: 'Lihat Detail PO',
    variant: ElevarmViewDetailCardVariant.primary,
    onTap: (context) {},
)
```

### `ElevarmThumbnailList`

| Component              | Screenshot                                                                                                                                                                                  |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmThumbnailList` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fthumbnail_list.png?alt=media&token=459070a8-e408-4f3e-ad60-5a3bc8911bc7"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmThumbnailList(
    imageUrls: [],
    size: 62.0,
    onTap: (context, index) {},
)
```

### `ElevarmRadioButton`

| Component            | Screenshot                                                                                                                                                                                                                                                                                                                                                                                |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmRadioButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fradio-buttons-1.png?alt=media&token=1f046f02-e503-4045-8e3d-f8f8fa76b9a6"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fradio-buttons-2.png?alt=media&token=ffe9e9ed-0f00-4a54-a026-bc54531375b7"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Radio button only.
ElevarmRadioButton<String>(
    value: 'farmer',
    groupValue: _selectedFarmer,
    onChanged: (String newSelectedFarmer) {},
)
/// With supporting texts.
ElevarmRadioButton<String>(
    value: 'farmer',
    groupValue: _selectedFarmer,
    onChanged: (String newSelectedFarmer) {},
    title: 'Remember me',
    subtitle: 'Save my login details for next time.',
)
```

### `ElevarmRadioListTile`

| Component              | Screenshot                                                                                                                                                                                   |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmRadioListTile` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fradio-list-tile.png?alt=media&token=03097f8e-a4a0-4bda-b021-bf36b9e8d6ad"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmRadioListTile<BankAccountModel>(
    value: data,
    groupValue: _selectedAccount,
    onChanged: _handleChangeRadioButtonValue,
    title: data.accountNumber ?? '',
    subtitle: data.holderName ?? '',
    trailingWidget: Container(
        width: 50,
        height: 50,
        color: ElevarmColors.neutral50,
        child: Center(
        child: Text(data.bankName ?? ''),
        ),
    ),
),
```

### `ElevarmTwoChoiceRadioCard`

| Component                   | Screenshot                                                                                                                                                                                         |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTwoChoiceRadioCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fradio-two-choice-card.png?alt=media&token=96fec5b8-a6cc-4c0f-9e67-99d8b703be94"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmTwoChoiceRadioCard(
    groupValue: _currentValue,
    onChanged: (String newValue) {
        // on change 
    },
    items: [
        ElevarmRadioItemModel(
            value: '1',
            title: 'Petani Mitra',
        ),
        ElevarmRadioItemModel(
            value: '2',
            title: 'Toko Tani',
        ),
    ],
)
```

### `ElevarmIconRipple`

| Component           | Screenshot                                                                                                                                                                          |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmIconRipple` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fripple.png?alt=media&token=e6b239ee-cf40-495a-9997-b0a248d7eeeb"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmIconRipple(
    backgroundColor: ElevarmColors.success200,
    iconAssetName: ElevarmIconsOutline.check,
    iconColor: ElevarmColors.success,
    rippleColor: ElevarmColors.success100,
),
```



### `ElevarmSecondaryButton`

| Component                | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmSecondaryButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fsecondary-buttons.png?alt=media&token=8fd8034f-5747-4dc5-be24-3a15e92cc2b2"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fsecondary-buttons-destructive.png?alt=media&token=6b95e0f4-6b03-443a-8b51-01e4ae60eea7"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmSecondaryButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmSecondaryButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmSecondaryButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmStackedHorizontalBarChart`

| Component                          | Screenshot                                                                                                                                                                                                |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmStackedHorizontalBarChart` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fstacked-horizontal-bar-chart.png?alt=media&token=77cf4333-6efa-4f0f-93d4-6ce1de36e288"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmOutlinedCard(
    child: ElevarmStackedHorizontalBarChart(
        tooltipTitle: 'Komoditas',
        legendValueBuilder: (data) => '${data.value}x rotasi',
        dataSource: [
            ElevarmStackedHorizontalBarChartData(
                label: 'Jagung',
                value: 15,
                color: ElevarmColors.success,
                customData: '1000 Transaksi',
            ),
            ElevarmStackedHorizontalBarChartData(
                label: 'Mentimun',
                value: 12,
                color: ElevarmColors.primary,
                customData: '2k Transaksi',
            ),
        ],
    )
)
```

### `ElevarmStackedVerticalBarChartCard`

| Component                            | Screenshot                                                                                                                                                                                                    |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmStackedVerticalBarChartCard` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fstacked-vertical-bar-chart-cards.png?alt=media&token=694d017c-aef9-496d-bd15-8fb23b120761"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmStackedVerticalBarChartCard(
    title: 'Komparasi Petani Terscout & Terdaftar Sebagai Mitra',
    tooltipTitle: 'Petani',
    subtitle: 'Terakhir diperbarui 30/11/2021 - 09.30 WIB',
    dataSource: [
        ElevarmStackedVerticalBarChartDataSeries(
            label: 'Sewa',
            color: ElevarmColors.success,
            dataPoints: [
                ElevarmStackedVerticalBarChartData(
                    label: 'Jan',
                    value: 10,
                ),
                ElevarmLineChartData(
                    label: 'Feb',
                    value: 15,
                ),
            ],
        ),
    ],
)
```

### `ElevarmStepper`

| Component        | Screenshot                                                                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmStepper` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fsteppers.png?alt=media&token=4ce21f36-ede9-4c26-bb8c-617b2aff45cd"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmStepper(
    steps: <ElevarmStepperStep>[
        ElevarmStepperStep(
            title: 'Step 1',
            subtitle: 'This is the first step',
            onTap: () {},
        ),
        ElevarmStepperStep(
            title: 'Step 2',
            subtitle: 'This is the second step',
            onTap: () {},
        ),
        ElevarmStepperStep(
            title: 'Step 3',
            subtitle: 'This is the third step',
            onTap: () {},
        ),
    ],
    currentStep: 0,
),
```

### `ElevarmSwitch`

| Component       | Screenshot                                                                                                                                                                            |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmSwitch` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fswitches.png?alt=media&token=56958ec4-db8f-4f3f-b297-e2e31575137c"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

/// Switched on or not.
ElevarmSwitch(
    value: false,
    onChanged: (newValue) {},
)
/// With supporting texts.
ElevarmSwitch(
    value: false,
    onChanged: (newValue) {},
    title: 'Remember me',
    subtitle: 'Save my login details for next time.',
)
```

### `ElevarmSwitchListTile`

| Component               | Screenshot                                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmSwitchListTile` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fswitch_list_tile.png?alt=media&token=01b2da61-d5dd-4e81-a65c-e4d910738134"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmSwitchListTile(
    title: 'Terdapat serangan penyakit?',
    value: false,
    onChanged: (value) {},
)
```

### `ElevarmTabBar`

| Component       | Screenshot                                                                                                                                                                            |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTabBar` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftab-bars.png?alt=media&token=c6da020e-adf1-4dff-83c8-71bff50f31d4"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmTabBar(
    labels: const ['Petani', 'Komoditas'],
    activeIndex: 0,
    onChange: (int newIndex) {},
)
```

### `ElevarmTag`

| Component    | Screenshot                                                                                                                                                                       |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTag` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftag.png?alt=media&token=b44abae5-3556-49a9-b010-7acac7e8bc48"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Normal.
ElevarmTag(
    text: 'Label',
    size: ElevarmTagSize.sm,
)

// With trailing close icon.
ElevarmTag(
    text: 'Label',
    size: ElevarmTagSize.sm,
    trailing: ElevarmTagTrailing.closeIcon,
)

// With trailing count.
ElevarmTag(
    text: 'Label',
    size: ElevarmTagSize.sm,
    trailing: ElevarmTagTrailing.count,
    count: 5,
)

// With avatar.
ElevarmTag.avatar(
    text: 'Label',
    size: ElevarmTagSize.sm,
    avatarImage: const AssetImage('assets/images/female_avatar.png'),
)

// With dot.
ElevarmTag.dot(
    text: 'Label',
    size: ElevarmTagSize.sm,
)

// With checkbox.
ElevarmTag(
    text: 'Label',
    size: ElevarmTagSize.sm,
    showCheckbox: true,
    checkboxValue: _myCheckboxValue,
    onTap: () {
        setState(() {
            _myCheckboxValue = !_myCheckboxValue;
        });
    }
)
```

### `ElevarmTextDropdownInputField`

| Component                       | Screenshot                                                                                                                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTextDropdownInputField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftext-dropdown-input-fields.png?alt=media&token=8db3d1dc-f9e1-4978-8f02-4bf2cfe2fd3a"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmTextDropdownInputField(
    label: 'Berat',
    hintText: '0',
    helperText: 'Berat komoditas.',
    errorText: 'This is an error message.',
    dropdownInitialValue: 'Kg',
    dropdownOptions: [
        ElevarmDropdownInputFieldOption(
            title: 'Kg',
            value: 'Kg',
        ),
        ElevarmDropdownInputFieldOption(
            title: 'Gr',
            value: 'Gr',
        ),
    ],
    dropdownOnChanged: (value) {},
    enabled: true,
)
```

### `ElevarmTextInputField`

| Component               | Screenshot                                                                                                                                                                                     |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTextInputField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftext-input-fields.png?alt=media&token=3a7c4e22-947d-4a4d-aeb7-f22c31b4f0f3"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmTextInputField(
    label: 'Email',
    hintText: 'olivia@untitledui.com',
    helperText: 'This is a hint text to help user.',
    suffixIconAssetName: ElevarmIconsOutline.helpCircle,
    onTapSuffix: null,
    errorText: null,
    enabled: true,
)
```

### `ElevarmTypeAheadInputField`

| Component                    | Screenshot                                                                                                                                                                                                 |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTypeAheadInputField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Felevarm_typeahead_input_field.gif?alt=media&token=7cf0a09c-b692-4064-ac6d-f060ea48b2da"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

 ElevarmAutocompleteTextField<CommodityModel?>(
      label: label,
      hintText: hintText,
      initialData: commodityData,
      focusNode: focusNode,
      isRequired: true,
      autoFlipDirection: true,
      controller: TextEditingController(text: commodityData?.name ?? ''),
      suggestionsCallback: (pattern) async {
        final result =
            await commodityRepository.getListCommodities(name: pattern);
        return result.data ?? [];
      },
      itemBuilder: (context, item) {
        return Text(item?.name ?? '-');
      },
      onSuggestionSelected: (suggestion) {
        widget.onCommodityDropdownChanged(
          widget.index,
          suggestion,
        );
      },
    );
```

### `ElevarmTertiaryNeutralButton`

| Component                      | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTertiaryNeutralButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftertiary-neutral-buttons.png?alt=media&token=722b76f5-e13a-45f0-8abd-95884769bf79"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftertiary-neutral-buttons-destructive.png?alt=media&token=da83ab69-f1af-400d-a546-58e45b008b0a"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmTertiaryNeutralButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmTertiaryNeutralButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmTertiaryNeutralButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```

### `ElevarmTertiaryPrimaryButton`

| Component                      | Screenshot                                                                                                                                                                                            |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmTertiaryPrimaryButton` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Ftertiary-primary-buttons.png?alt=media&token=1944a46a-b5c8-4f94-8929-df9f6726e71b"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Button with only text
ElevarmTertiaryPrimaryButton.text(
    text: 'Button CTA',
    onPressed: () {},
)
// Button with text & icon (trailing and/or leading)
ElevarmTertiaryPrimaryButton.icon(
    text: 'Button CTA',
    onPressed: () {},
    height: buttonSize['size'] as double,
    leadingIconAssetName: ElevarmIconsOutline.plus,
    trailingIconAssetName: null,
)
// Button with only icon
ElevarmTertiaryPrimaryButton.iconOnly(
    iconAssetName: ElevarmIconsOutline.plus,
    onPressed: () {},
)
```
### `showElevarmSelectDateRangeBottomSheet`

| Component                               | Screenshot                                                                                                                                                                                                                                                                                                                                                                                                              |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `showElevarmSelectDateRangeBottomSheet` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fselect-date-years-bottom-sheet.png?alt=media&token=633ddc6e-96b3-4fe7-b15a-92129218e134"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fselect-date-range-bottom-sheet.png?alt=media&token=e52c46a4-e67c-4fea-aceb-bc9fb505c853"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Show select date range bottom sheet
showElevarmSelectDateRangeBottomSheet(
    context: context,
    onPressedClose: () {},
    onPressedActivate: (selectedDateRange) {},
    onPressedReset: () {},
    selectedYear: 2020,
    initialOption: ElevarmSelectDateRangeBottomSheetOption.selectYear
);
```

### `showElevarmDatePickerDialog`

| Component                     | Screenshot                                                                                                                                                                                                                                                                                                                                                                                              |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `showElevarmDatePickerDialog` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdate-picker-dialogs.png?alt=media&token=94503928-ee6c-4e24-8772-e2a3a42994ef"  /> <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdate-range-picker-dialogs.png?alt=media&token=cec1ad21-f0d8-4702-8a16-ff393765530d"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Show date picker dialog
showElevarmDatePickerDialog(
    context: context,
    initialDisplayDate: DateTime(2022, 1, 1),
    initialSelectedDate: DateTime(2022, 1, 1),
).then((value) {
    print("RESULT: $value");
});

// Show date range picker dialog
showElevarmDatePickerDialog(
    context: context,
    mode: ElevarmDatePickerMode.range,
    initialDisplayDate: DateTime(2022, 1, 1),
    initialSelectedRange: DateTimeRange(
        start: DateTime(2022, 1, 1),
        end: DateTime(2022, 1, 31),
    ),
).then((value) {
    print("RESULT: $value");
});
```

### `showElevarmSnackBar` and `showElevarmSnackBarDesktop`

| Component                    | Screenshot                                                                                                                                                                                    |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `showElevarmSnackBar`        | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fsnackbar-mobile.png?alt=media&token=703da90c-423e-42bc-ae3f-3eb5ebc2a56b"  />  |
| `showElevarmSnackBarDesktop` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fsnackbar-desktop.png?alt=media&token=13076071-cac3-47d7-8f7c-4f0c3d6f3414"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

// Show Snackbar (for mobile).
showElevarmSnackBar(
    context: context,
    iconAssetName: ElevarmIconsOutline.plus,
    alignment: Alignment.topRight,
    iconColor: ElevarmColors.success,
    title: 'Perubahan Berhasil Dilakukan',
    subtitle: 'Setoran potongan kotor diubah dengan nilai potongan sebesar 5%',
    positiveText: 'Lihat Detail',
    onPositiveButton: (animationController) {
        animationController?.reverse();
    },
    negativeText: 'Tutup',
    onNegativeButton: (animationController) {
        animationController?.reverse();
    },
    onCloseButton: (animationController) {
        animationController?.reverse();
    },
    onAnimationControllerInit: (animationController) {
        /// Save AnimationController in a state.
        _snackBarAnimationController = animationController;
    },
);

// Show Snackbar (for desktop).
showElevarmSnackBarDesktop(
    context: context,
    iconAssetName: ElevarmIconsOutline.plus,
    alignment: Alignment.topRight,
    iconColor: ElevarmColors.success,
    title: 'Perubahan Berhasil Dilakukan',
    subtitle: 'Setoran potongan kotor diubah dengan nilai potongan sebesar 5%',
    positiveText: 'Lihat Detail',
    onPositiveButton: (animationController) {
        animationController?.reverse();
    },
    negativeText: 'Tutup',
    onNegativeButton: (animationController) {
        animationController?.reverse();
    },
    onCloseButton: (animationController) {
        animationController?.reverse();
    },
    onAnimationControllerInit: (animationController) {
        /// Save AnimationController in a state.
        _snackBarAnimationController = animationController;
    },
);
```

## D. Advanced Component

### `ElevarmMobilePaginationFooter`

| Component                       | Screenshot                                                                                                                                                                                                      |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmMobilePaginationFooter` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fadvanced-components%2Fmobile-pagination-footers.png?alt=media&token=90c0e839-d86f-4000-83dd-21fe6440a691"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmMobilePaginationFooter(
    currentPage: _currentPage,
    numPages: 10,
    onPressedNext: _currentPage < 10 ? _handlePressedNext : null,
    onPressedPrevious:
        _currentPage > 1 ? _handlePressedPrevious : null,
),
```

### `ElevarmDektopPaginationFooter`

| Component                        | Screenshot                                                                                                                                                                                            |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmDesktopPaginationFooter` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fcomponents%2Fdektop_pagination_footer.png?alt=media&token=f5df10c0-a854-4684-952b-75894afd853d"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmDesktopPaginationFooter(
    currentPage: _currentPage,
    numPages: 10,
    onPressedNext: _currentPage < 10 ? _handlePressedNext : null,
    onPressedPrevious:
        _currentPage > 1 ? _handlePressedPrevious : null,
    onPressedPage: (int){},
    String previousIconAssetName = ElevarmIconsOutline.chevronLeftDouble,   
    String nextIconAssetName = ElevarmIconsOutline.chevronRightDouble,   
    double height = 40,
),
```

### `ElevarmOtpField`

| Component         | Screenshot                                                                                                                                                                                        |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmOtpField` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fadvanced-components%2Fotp_field_1.png?alt=media&token=cf4bf8e8-3fd0-4f59-951c-2b8cdb57088c"  /> |
|                   | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fadvanced-components%2Fotp_field_2.png?alt=media&token=985f90ce-1310-400e-8a9e-09371a312c06"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

OtpFormField(
    length: 4 // length of fields,
    onChanged: (String otp) {} // callback on fields changed,
    onResendOtpCode: () {} // callback on tap resend otp code text,
    duration: 60 // resend timer duration. default: 30
),
```

## E. ThemeData

### `ElevarmThemeData.light()`

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

MaterialApp(
    theme: ElevarmThemeData.light(),
)
```
## F. Screens

### `Elevarm404DesktopScreen`

| Screen                    | Screenshot                                                                                                                                                                                   |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Elevarm404DesktopScreen` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fscreens%2F404-desktop-screen.jpg?alt=media&token=e59334d2-182b-40e5-9692-160831dc1060"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

Elevarm404DesktopScreen(
    prevNavButtonAction: () {} ,
    mainNavButtonAction: () {} ,
    prevNavButtonLabel = 'Kembali Ke Sebelumnya', // Default value
    mainNavButtonLabel = 'Pergi Ke Dashboard', // Default value
    highlight = "Ooppss!", // Default value
    title = "404 Page not Found", // Default value
    description = "Maaf, halaman yang Anda cari tidak ada atau telah dipindahkan.", // Default value
    image = "packages/elevarm_ui/assets/images/not_found_illustration.png", // Default value
),
```

### `ElevarmUnderConstructionDesktopScreen`

| Screen                                  | Screenshot                                                                                                                                                                                                  |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmUnderConstructionDesktopScreen` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fscreens%2Funder-construction-desktop-screen.jpg?alt=media&token=e67d6a74-64a7-4ec2-af46-9ed7f86e65d2"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmUnderConstructionDesktopScreen(
    prevNavButtonAction: () {} ,
    mainNavButtonAction: () {} ,
    prevNavButtonLabel = 'Kembali Ke Sebelumnya', // Default value
    mainNavButtonLabel = 'Pergi Ke Dashboard', // Default value
    highlight = "Under Construction!", // Default value
    title = "Ooopss.. Error!", // Default value
    description = "Halaman yang Anda cari saat ini sedang dalam perbaikan dan akan segera kembali. Pantau terus!", // Default value
    image = "packages/elevarm_ui/assets/images/under_construction_illustration.png", // Default value
),
```

### `ElevarmErrorDesktopScreen`

| Screen                      | Screenshot                                                                                                                                                                                     |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ElevarmErrorDesktopScreen` | <img src="https://firebasestorage.googleapis.com/v0/b/elevarm-ui-demo.appspot.com/o/screenshots%2Fscreens%2Ferror-desktop-screen.jpg?alt=media&token=2cb35c87-783d-4e4c-9a87-114a9b61b367"  /> |

```dart
import 'package:elevarm_ui/elevarm_ui.dart';

ElevarmErrorDesktopScreen(
    prevNavButtonAction: () {} ,
    mainNavButtonAction: () {} ,
    prevNavButtonLabel = 'Kembali Ke Sebelumnya', // Default value
    mainNavButtonLabel = 'Pergi Ke Dashboard', // Default value
    title = "Ooopss.. Error!", // Default value
    description = "Halaman yang Anda cari tidak ada. Berikut ini beberapa tautan bermanfaat:", // Default value Default value
),
```

## Development

This section is intended for people that wants to develop `elevarm_ui` package.

### Getting Started

Follow instructions below to install this project on your machine.

1. Clone this repository to your machine.
2. Go inside the cloned repository:
   ```shell
   cd elevarm_ui
   ```
3. Switch to `dev` branch:
   ```shell
   git checkout dev
   ```
4. Setup local git hooks:
   ```shell
   dart run tool/setup_git_hooks.dart
   ```
5. Create `env.json` file by copying `env-example.json`:
   ```shell
   cp env-example.json env.json
   ```
6. Update all the values inside `env.json` with your own credentials.
7. Get all project dependencies:
   ```shell
   flutter pub get
   ```

## Additional information

**⚠️ Disclaimer ⚠️**: This package is primarily used for internal usage. At the moment, there are no plans to support external/public needs. Regardless, we thank you for interest for this package. For more information, please contact <a href="mailto:majid@elevarm.com">Admin</a>
