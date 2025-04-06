import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// [ElevarmDropdownInputField] option class.
class ElevarmDropdownInputFieldOption<T> {
  /// The option value.
  final T value;

  /// The option title.
  final String title;

  /// The option subtitle.
  final String? subtitle;

  ElevarmDropdownInputFieldOption({
    required this.value,
    required this.title,
    this.subtitle,
  });
}

/// Elevarm UI's dropdown input field.
class ElevarmDropdownInputField<T> extends StatefulWidget {
  /// The dropdown options.
  final List<ElevarmDropdownInputFieldOption<T>> options;

  /// The initial value.
  final T? initialValue;

  /// The callback when value is changed.
  final void Function(T? value) onChanged;

  /// Check icon asset name for selected option.
  final IconData checkIconAssetName;

  /// Suffix icon asset name.
  final IconData suffixIconAssetName;

  /// Prefix icon asset name.
  final IconData? prefixIconAssetName;

  /// The label above the input field.
  final String? label;

  /// The error text if any.
  final String? errorText;

  /// The hint text.
  final String? hintText;

  /// The helper text.
  final String? helperText;

  /// The text field size.
  final ElevarmTextInputFieldSize textInputSize;

  /// Whether the field is required or not.
  final bool isRequired;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [InputDecoration.enabled] property.
  final bool enabled;

  /// Optional [TextEditingController].
  final TextEditingController? controller;

  const ElevarmDropdownInputField({
    required this.options,
    required this.onChanged,
    this.textInputSize = ElevarmTextInputFieldSize.md,
    this.enabled = true,
    this.hintText,
    this.errorText,
    this.suffixIconAssetName = ElevarmIconsOutline.chevron_down,
    this.prefixIconAssetName,
    this.checkIconAssetName = ElevarmIconsOutline.check,
    this.label,
    this.helperText,
    this.initialValue,
    this.isRequired = false,
    this.controller,
    super.key,
  });

  @override
  State<ElevarmDropdownInputField<T>> createState() =>
      _ElevarmDropdownInputFieldState<T>();
}

class _ElevarmDropdownInputFieldState<T>
    extends State<ElevarmDropdownInputField<T>> {
  final GlobalKey _widgetKey = GlobalKey();
  late TextEditingController _controller;
  ElevarmDropdownInputFieldOption<T>? _value;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      ElevarmDropdownInputFieldOption<T>? newOption;
      for (var option in widget.options) {
        if (option.value == _controller.text) {
          newOption = option;
        }
      }
      _value = newOption;
    });
    if (widget.initialValue != null) {
      ElevarmDropdownInputFieldOption<T>? initialOption;
      for (var option in widget.options) {
        if (option.value == widget.initialValue) {
          initialOption = option;
        }
      }
      _controller.text = initialOption?.title ?? '';
      _value = initialOption;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ElevarmTextInputField(
          controller: _controller,
          key: _widgetKey,
          label: widget.label,
          isRequired: widget.isRequired,
          helperText: widget.helperText,
          errorText: widget.errorText,
          hintText: widget.hintText,
          readOnly: true,
          prefixIconAssetName: widget.prefixIconAssetName,
          suffixIconAssetName: widget.suffixIconAssetName,
          enabled: widget.enabled,
          mouseCursor: widget.enabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onTap: () {
            final RenderBox renderBox =
                _widgetKey.currentContext?.findRenderObject() as RenderBox;
            final Size size = renderBox.size;
            final Offset offset = renderBox.localToGlobal(Offset.zero);
            showMenu(
              constraints: constraints,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  ElevarmBorderRadius.sm,
                ),
              ),
              context: context,
              position: RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + size.height,
                offset.dx,
                offset.dy + size.height,
              ),
              items: [
                ...widget.options.map((option) {
                  return PopupMenuItem(
                    padding: EdgeInsets.zero,
                    enabled: false,
                    value: option.value,
                    child: Container(
                      width: constraints.biggest.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                      ),
                      child: Material(
                        color: (_value?.value == option.value
                            ? const Color(0xFFF9FAFB)
                            : ElevarmColors.white),
                        borderRadius: BorderRadius.circular(6.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _value = option;
                            });
                            _controller.text = option.title;
                            widget.onChanged(option.value);
                          },
                          borderRadius: BorderRadius.circular(6.0),
                          hoverColor: ElevarmColors.primary100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        option.title,
                                        style: LibraryTextStyles
                                            .interMdMediumNeutral,
                                      ),
                                      option.subtitle != null
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Text(
                                                option.subtitle!,
                                                style: LibraryTextStyles
                                                    .interMdRegularNeutral400,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                _value?.value == option.value
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: ElevarmIcon(
                                          widget.checkIconAssetName,
                                          color: ElevarmColors.primary,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        );
      },
    );
  }
}
