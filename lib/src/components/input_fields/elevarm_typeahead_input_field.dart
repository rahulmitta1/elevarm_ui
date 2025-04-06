import 'dart:async';

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ElevarmTypeAheadInputField<T> extends StatefulWidget {
  /// Whether the field is required or not.
  final bool isRequired;

  /// The label above the input field.
  final String label;

  /// The hint text.
  final String hintText;

  /// The error text if any.
  final String? errorText;

  /// The helper text.
  final String? helperText;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [InputDecoration.enabled] property.
  final bool enabled;

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

  /// The text field size.
  final ElevarmTextInputFieldSize size;

  /// Used to overcome [Flutter issue 98507](https://github.com/flutter/flutter/issues/98507)
  /// Most commonly experienced when placing the
  /// [TypeAheadFormField] on a google map in Flutter Web.
  final bool intercepting;

  /// If set to true, in the case where the suggestions box has less than
  /// _SuggestionsBoxController.minOverlaySpace to grow in the desired
  /// [direction], the direction axis will be temporarily flipped
  /// if there's more room available in the opposite direction.
  ///
  /// Defaults to false
  final bool autoFlipDirection;

  /// Initial value of [T]
  final T initialData;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Called with the search pattern to get the search suggestions.
  ///
  /// This callback must not be null. It is be called by the TypeAhead widget
  /// and provided with the search pattern. It should return a [List](https://api.dartlang.org/stable/2.0.0/dart-core/List-class.html)
  /// of suggestions either synchronously, or asynchronously (as the result of a
  /// [Future](https://api.dartlang.org/stable/dart-async/Future-class.html)).
  /// Typically, the list of suggestions should not contain more than 4 or 5
  /// entries. These entries will then be provided to [itemBuilder] to display
  /// the suggestions.
  ///
  /// Example:
  /// ```dart
  /// suggestionsCallback: (pattern) async {
  ///   return await _getSuggestions(pattern);
  /// }
  /// ```
  final FutureOr<List<T>?> Function(String pattern) suggestionsCallback;

  /// Called for each suggestion returned by [suggestionsCallback] to build the
  /// corresponding widget.
  ///
  /// This callback must not be null. It is called by the TypeAhead widget for
  /// each suggestion, and expected to build a widget to display this
  /// suggestion's info. For example:
  ///
  /// ```dart
  /// itemBuilder: (context, suggestion) {
  ///   return ListTile(
  ///     title: Text(suggestion['name']),
  ///     subtitle: Text('USD' + suggestion['price'].toString())
  ///   );
  /// }
  /// ```
  final Function(BuildContext context, T item) itemBuilder;

  /// Called when a suggestion is tapped.
  ///
  /// This callback must not be null. It is called by the TypeAhead widget and
  /// provided with the value of the tapped suggestion.
  ///
  /// For example, you might want to navigate to a specific view when the user
  /// tabs a suggestion:
  /// ```dart
  /// onSuggestionSelected: (suggestion) {
  ///   Navigator.of(context).push(MaterialPageRoute(
  ///     builder: (context) => SearchResult(
  ///       searchItem: suggestion
  ///     )
  ///   ));
  /// }
  /// ```
  ///
  /// Or to set the value of the text field:
  /// ```dart
  /// onSuggestionSelected: (suggestion) {
  ///   _controller.text = suggestion['name'];
  /// }
  /// ```
  final void Function(T suggestion) onSuggestionSelected;

  final Widget Function(BuildContext, Object?)? errorBuilder;

  const ElevarmTypeAheadInputField({
    required this.label,
    required this.initialData,
    required this.focusNode,
    required this.controller,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    required this.hintText,
    this.isRequired = false,
    this.errorText,
    this.helperText,
    this.size = ElevarmTextInputFieldSize.md,
    this.enabled = true,
    this.intercepting = false,
    this.autoFlipDirection = false,
    this.errorBuilder,
    super.key,
  });

  @override
  State<ElevarmTypeAheadInputField<T>> createState() =>
      _ElevarmTypeAheadInputFieldState<T>();
}

class _ElevarmTypeAheadInputFieldState<T>
    extends State<ElevarmTypeAheadInputField<T>> {
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
    if (widget.size == ElevarmTextInputFieldSize.sm) {
      contentPadding = const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 12.0,
      );
    } else {
      contentPadding = const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 14.0,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevarmInputFieldLabel(
          label: widget.label,
          isRequired: widget.isRequired,
        ),
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
                    const BoxShadow(
                      color: Color(0xFFEBF1FF),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 4.0,
                    ),
                  ],
          ),
          child: TypeAheadField<T>(
            controller: widget.controller,
            autoFlipDirection: widget.autoFlipDirection,
            decorationBuilder: (context, child) {
              return Container(
                color: ElevarmColors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
                ),
                child: child,
              );
            },
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller, // note how the controller is passed
                focusNode: focusNode,
                enabled: widget.enabled,
                style: LibraryTextStyles.interMdRegularNeutral,
                cursorColor: widget.errorText == null
                    ? ElevarmColors.primary
                    : ElevarmColors.danger,
                decoration: InputDecoration(
                  errorText: widget.errorText,
                  isDense: true,
                  counterText: '',
                  contentPadding: contentPadding,
                  fillColor: ElevarmColors.white,
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
                ),
              );
            },
            suggestionsCallback: widget.suggestionsCallback,
            itemBuilder: (context, itemData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: widget.itemBuilder(context, itemData),
              );
            },
            onSelected: widget.onSuggestionSelected,
            errorBuilder: widget.errorBuilder,
          ),
        ),
      ],
    );
  }
}
