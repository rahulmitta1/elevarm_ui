import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

/// Elevarm UI's OTP Form component widget.
class ElevarmOtpField extends StatelessWidget {
  /// Callback when OTP's value is changed
  final Function(String) onChanged;

  /// Length of text fields
  final int length;

  const ElevarmOtpField({
    required this.onChanged,
    required this.length,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: Pinput(
        length: length,
        defaultPinTheme: PinTheme(
          textStyle: LibraryTextStyles.interMdRegularNeutral,
          decoration: BoxDecoration(
            border: Border.all(color: ElevarmColors.neutral100),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (pin) => onChanged(pin),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
