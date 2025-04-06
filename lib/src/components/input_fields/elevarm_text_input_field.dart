import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Possible size values for [ElevarmTextInputField].
enum ElevarmTextInputFieldSize {
  sm, // Small
  md, // Medium
}

/// Elevarm UI's text input field.
///
/// This component was made as closely as possible to [TextFormField].
class ElevarmTextInputField extends StatefulWidget {
  /// The label above the input field.
  final String? label;

  /// The error text if any.
  final String? errorText;

  /// The hint text.
  final String? hintText;

  /// The helper text.
  final String? helperText;

  /// The prefix icon asset name.
  final IconData? prefixIconAssetName;

  /// The prefix text.
  final String? prefixText;

  /// The prefix add-on text.
  final String? prefixAddOnText;

  /// Whether to use mastercard icon as prefix.
  final bool prefixUseMastercard;

  /// The suffix icon asset name.
  final IconData? suffixIconAssetName;

  /// The suffix icon color.
  final Color suffixIconColor;

  /// The suffix error icon color.
  final Color suffixErrorIconColor;

  /// The suffix add-on text.
  final String? suffixAddOnText;

  /// The suffix icon asset name displayed when [errorText] is not null.
  final IconData? suffixErrorIconAssetName;

  /// The callback when suffix icon is tapped.
  final VoidCallback? onTapSuffix;

  /// The text field size.
  final ElevarmTextInputFieldSize size;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [InputDecoration.enabled] property.
  final bool enabled;

  /// Whether the field is required or not.
  final bool isRequired;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  final String? initialValue;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// The type of action button to use for the keyboard.
  ///
  /// Defaults to [TextInputAction.newline] if [keyboardType] is
  /// [TextInputType.multiline] and [TextInputAction.done] otherwise.
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.services.TextInputConfiguration.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.services.TextInputConfiguration.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.services.TextInputConfiguration.enableSuggestions}
  final bool enableSuggestions;

  /// Determines how the [maxLength] limit should be enforced.
  ///
  /// {@macro flutter.services.textFormatter.effectiveMaxLengthEnforcement}
  ///
  /// {@macro flutter.services.textFormatter.maxLengthEnforcement}
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.maxLines}
  ///  * [expands], which determines whether the field should fill the height of
  ///    its parent.
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  ///  * [expands], which determines whether the field should fill the height of
  ///    its parent.
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// The maximum number of characters (Unicode scalar values) to allow in the
  /// text field.
  ///
  /// If set, a character counter will be displayed below the
  /// field showing how many characters have been entered. If set to a number
  /// greater than 0, it will also display the maximum number allowed. If set
  /// to [TextField.noMaxLength] then only the current character count
  /// is displayed.
  ///
  /// After [maxLength] characters have been input, additional input
  /// is ignored, unless [maxLengthEnforcement] is set to
  /// [MaxLengthEnforcement.none].
  ///
  /// The text field enforces the length with a
  /// [LengthLimitingTextInputFormatter],
  /// which is evaluated after the supplied [inputFormatters], if any.
  ///
  /// This value must be either null, [TextField.noMaxLength], or greater
  /// than 0.
  /// If null (the default) then there is no limit to the number of characters
  /// that can be entered. If set to [TextField.noMaxLength], then no limit will
  /// be enforced, but the number of characters entered will still be displayed.
  ///
  /// Whitespace characters (e.g. newline, space, tab) are included in the
  /// character count.
  ///
  /// If [maxLengthEnforcement] is [MaxLengthEnforcement.none], then more than
  /// [maxLength] characters may be entered, but the error counter and divider
  /// will switch to the [decoration]'s [InputDecoration.errorStyle] when the
  /// limit is exceeded.
  ///
  /// {@macro flutter.services.lengthLimitingTextInputFormatter.maxLength}
  final int? maxLength;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatters], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted]:
  ///    which are more specialized input change notifications.
  final void Function(String)? onChanged;

  /// {@template flutter.material.textfield.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  ///
  /// The text field builds a [GestureDetector] to handle input events like tap,
  /// to trigger focus requests, to move the caret, adjust the selection, etc.
  /// Handling some of those events by wrapping the text field with a competing
  /// GestureDetector is problematic.
  ///
  /// To unconditionally handle taps, without interfering with the text field's
  /// internal gesture detector, provide this callback.
  ///
  /// If the text field is created with [enabled] false, taps will not be
  /// recognized.
  ///
  /// To be notified when the text field gains or loses the focus, provide a
  /// [focusNode] and add a listener to that.
  ///
  /// To listen to arbitrary pointer events without competing with the
  /// text field's internal gesture detector, use a [Listener].
  /// {@endtemplate}
  final void Function()? onTap;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final void Function()? onEditingComplete;

  final void Function(String)? onFieldSubmitted;

  final void Function(String?)? onSaved;

  final String? Function(String?)? validator;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to [ThemeData.brightness].
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool? enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// Callback that generates a custom [InputDecoration.counter] widget.
  ///
  /// See [InputCounterWidgetBuilder] for an explanation of the passed in
  /// arguments.  The returned widget will be placed below the line in place of
  /// the default widget built when [InputDecoration.counterText] is specified.
  ///
  /// The returned widget will be wrapped in a [Semantics] widget for
  /// accessibility, but it also needs to be accessible itself. For example,
  /// if returning a Text widget, set the [Text.semanticsLabel] property.
  ///
  /// {@tool snippet}
  /// ```dart
  /// Widget counter(
  ///   BuildContext context,
  ///   {
  ///     required int currentLength,
  ///     required int? maxLength,
  ///     required bool isFocused,
  ///   }
  /// ) {
  ///   return Text(
  ///     '$currentLength of $maxLength characters',
  ///     semanticsLabel: 'character count',
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// If buildCounter returns null, then no counter and no Semantics widget will
  /// be created at all.
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.AutofillConfiguration.autofillHints}
  final Iterable<String>? autofillHints;

  final AutovalidateMode? autovalidateMode;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@template flutter.material.textfield.restorationId}
  /// Restoration ID to save and restore the state of the text field.
  ///
  /// If non-null, the text field will persist and restore its current scroll
  /// offset and - if no [controller] has been provided - the content of the
  /// text field. If a [controller] has been provided, it is the responsibility
  /// of the owner of that controller to persist and restore it, e.g. by using
  /// a [RestorableTextEditingController].
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  /// {@endtemplate}
  final String? restorationId;

  // ignore: lines_longer_than_80_chars
  /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
  final bool enableIMEPersonalizedLearning;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following
  /// [WidgetState]s:
  ///
  ///  * [WidgetState.error].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// If this property is null, [WidgetStateMouseCursor.textable]
  /// will be used.
  ///
  /// The [mouseCursor] is the only property of [TextField] that controls the
  /// appearance of the mouse pointer. All other properties related to "cursor"
  /// stand for the text cursor, which is usually a blinking vertical line at
  /// the editing position.
  final MouseCursor? mouseCursor;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// To give the keyboard focus to this widget, provide a [focusNode] and then
  /// use the current [FocusScope] to request the focus:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  ///
  /// This happens automatically when the widget is tapped.
  ///
  /// To be notified when the widget gains or loses the focus, add a listener
  /// to the [focusNode]:
  ///
  /// ```dart
  /// myFocusNode.addListener(() { print(myFocusNode.hasFocus); });
  /// ```
  ///
  /// If null, this widget will create its own [FocusNode].
  ///
  /// ## Keyboard
  ///
  /// Requesting the focus will typically cause the keyboard to be shown
  /// if it's not showing already.
  ///
  /// On Android, the user can hide the keyboard - without changing the focus -
  /// with the system back button. They can restore the keyboard's visibility
  /// by tapping on a text field. The user might hide the keyboard and
  /// switch to a physical keyboard, or they might just need to get it
  /// out of the way for a moment, to expose something it's
  /// obscuring. In this case requesting the focus again will not
  /// cause the focus to change, and will not make the keyboard visible.
  ///
  /// This widget builds an [EditableText] and will ensure that the keyboard is
  /// showing when it is tapped by calling
  /// [EditableTextState.requestKeyboard()].
  final FocusNode? focusNode;

  const ElevarmTextInputField({
    super.key,
    this.label,
    this.errorText,
    this.hintText,
    this.enabled = true,
    this.helperText,
    this.size = ElevarmTextInputFieldSize.md,
    this.prefixIconAssetName,
    this.prefixText,
    this.prefixAddOnText,
    this.prefixUseMastercard = false,
    this.suffixAddOnText,
    this.suffixIconAssetName,
    this.suffixIconColor = ElevarmColors.neutral300,
    this.suffixErrorIconColor = ElevarmColors.danger,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.cursorHeight,
    this.cursorRadius,
    this.keyboardAppearance,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.mouseCursor,
    this.enableIMEPersonalizedLearning = true,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.cursorWidth = 2.0,
    this.maxLines = 1,
    this.obscuringCharacter = '•',
    this.enableSuggestions = true,
    this.expands = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.suffixErrorIconAssetName = ElevarmIconsOutline.alert_circle,
    this.onTapSuffix,
    this.focusNode,
    this.isRequired = false,
  });

  @override
  State<ElevarmTextInputField> createState() => _ElevarmTextInputFieldState();
}

class _ElevarmTextInputFieldState extends State<ElevarmTextInputField> {
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
    }
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry contentPadding;
    EdgeInsetsGeometry prefixAddOnTextContentPadding;
    EdgeInsetsGeometry prefixMastercardContentPadding;
    EdgeInsetsGeometry suffixAddOnTextContentPadding;
    if (widget.size == ElevarmTextInputFieldSize.sm) {
      contentPadding = const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 12.0,
      );
      prefixAddOnTextContentPadding = const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      );
      suffixAddOnTextContentPadding = const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      );
      prefixMastercardContentPadding = const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      );
    } else {
      contentPadding = const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 14.0,
      );
      prefixAddOnTextContentPadding = const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 14.0,
      );
      suffixAddOnTextContentPadding = const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 14.0,
      );
      prefixMastercardContentPadding = const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      );
    }

    Color finalSuffixIconColor;
    IconData? suffixIcon;

    Widget? suffixWidget;
    if (widget.suffixIconAssetName != null) {
      if (widget.enabled && widget.errorText != null) {
        finalSuffixIconColor = widget.suffixErrorIconColor;
        suffixIcon = widget.suffixErrorIconAssetName;
      } else {
        finalSuffixIconColor = widget.suffixIconColor;
        suffixIcon = widget.suffixIconAssetName;
      }
      suffixWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: IconButton(
          onPressed: widget.onTapSuffix,
          icon: ElevarmIcon(
            suffixIcon,
            color: finalSuffixIconColor,
            size: 16.0,
          ),
        ),
      );
    } else if (widget.suffixAddOnText != null) {
      suffixWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          margin: const EdgeInsets.only(
            left: 12.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: widget.errorText == null
                    ? ElevarmColors.neutral100
                    : ElevarmColors.danger300,
              ),
            ),
            // color: Colors.yellow,
          ),
          child: Padding(
            padding: suffixAddOnTextContentPadding,
            child: Center(
              child: Text(
                widget.suffixAddOnText!,
                style: LibraryTextStyles.interMdRegularNeutral300,
              ),
            ),
          ),
        ),
      );
    }

    Widget? prefixWidget;
    if (widget.prefixText != null) {
      prefixWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 8.0,
          ),
          child: Center(
            child: Text(
              widget.prefixText!,
              style: LibraryTextStyles.interMdRegularNeutral300,
            ),
          ),
        ),
      );
    } else if (widget.prefixIconAssetName != null) {
      prefixWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 8.0,
          ),
          child: ElevarmIcon(
            widget.prefixIconAssetName!,
            color: ElevarmColors.neutral300,
            size: 20.0,
          ),
        ),
      );
    } else if (widget.prefixAddOnText != null) {
      prefixWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          margin: const EdgeInsets.only(
            right: 12.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: widget.errorText == null
                    ? ElevarmColors.neutral100
                    : ElevarmColors.danger300,
              ),
            ),
            // color: Colors.yellow,
          ),
          child: Padding(
            padding: prefixAddOnTextContentPadding,
            child: Center(
              child: Text(
                widget.prefixAddOnText!,
                style: LibraryTextStyles.interMdRegularNeutral300,
              ),
            ),
          ),
        ),
      );
    } else if (widget.prefixUseMastercard) {
      prefixWidget = FittedBox(
        fit: BoxFit.fitHeight,
        child: Padding(
          padding: prefixMastercardContentPadding,
          child: Center(
            child: SvgPicture.asset(
              'packages/elevarm_ui/assets/images/mastercard.svg',
              height: 34.0,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? ElevarmInputFieldLabel(
                label: widget.label!,
                isRequired: widget.isRequired,
              )
            : Container(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: !_isFocused
                ? ElevarmBoxShadow.xs
                : [
                    const BoxShadow(
                      color: Color.fromRGBO(16, 24, 40, 0.05),
                      offset: Offset(1.0, 0.0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                    ),
                    BoxShadow(
                      color: widget.errorText == null
                          ? const Color(0xFFEBF1FF)
                          : const Color(0xFFFEE4E2),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 4.0,
                    ),
                  ],
          ),
          child: TextFormField(
            enabled: widget.enabled,
            style: LibraryTextStyles.interMdRegularNeutral,
            cursorColor: widget.errorText == null
                ? ElevarmColors.primary
                : ElevarmColors.danger,
            focusNode: _focusNode,
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              contentPadding: contentPadding,
              fillColor: widget.enabled
                  ? ElevarmColors.white
                  : ElevarmColors.neutral50,
              filled: true,
              hintText: widget.hintText,
              hintStyle: LibraryTextStyles.interMdRegularNeutral300,
              border: widget.errorText == null
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.neutral100,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.danger300,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
              enabledBorder: widget.errorText == null
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.neutral100,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.danger300,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ElevarmColors.neutral100,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: widget.errorText == null
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.primary200,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ElevarmColors.danger300,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
              prefixIcon: prefixWidget,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0.0,
                minHeight: 0.0,
              ),
              suffixIcon: suffixWidget,
            ),
            controller: widget.controller,
            initialValue: widget.initialValue,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            showCursor: widget.showCursor,
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            cursorHeight: widget.cursorHeight,
            cursorRadius: widget.cursorRadius,
            keyboardAppearance: widget.keyboardAppearance,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            selectionControls: widget.selectionControls,
            buildCounter: widget.buildCounter,
            scrollPhysics: widget.scrollPhysics,
            autofillHints: widget.autofillHints,
            autovalidateMode: widget.autovalidateMode,
            scrollController: widget.scrollController,
            restorationId: widget.restorationId,
            mouseCursor: widget.mouseCursor,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            scrollPadding: widget.scrollPadding,
            cursorWidth: widget.cursorWidth,
            maxLines: widget.maxLines,
            obscuringCharacter: widget.obscuringCharacter,
            enableSuggestions: widget.enableSuggestions,
            expands: widget.expands,
            obscureText: widget.obscureText,
            autocorrect: widget.autocorrect,
            autofocus: widget.autofocus,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
          ),
        ),
        widget.helperText != null &&
                (widget.errorText == null || !widget.enabled)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6.0),
                  Text(
                    widget.helperText!,
                    style: LibraryTextStyles.interXsRegularNeutral300,
                  ),
                ],
              )
            : Container(),
        widget.errorText != null && widget.enabled
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6.0),
                  Text(
                    widget.errorText!,
                    style: LibraryTextStyles.interXsRegularDanger,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
