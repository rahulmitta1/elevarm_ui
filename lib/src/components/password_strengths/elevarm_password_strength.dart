import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// [ElevarmPasswordStrength] validation class.
class ElevarmPasswordStrengthValidation {
  /// The validation label.
  final String label;

  /// The validation logic given the password input.
  final bool Function(String password) validate;

  ElevarmPasswordStrengthValidation({
    required this.label,
    required this.validate,
  });

  /// Default validation for checking whether password input contains uppercase
  /// & lowercase characters.
  factory ElevarmPasswordStrengthValidation.defaultContainsUpperLowerCase() {
    return ElevarmPasswordStrengthValidation(
      label: 'Kombinasi huruf besar dan kecil',
      validate: (password) =>
          password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]')),
    );
  }

  /// Default validation for checking whether password input contains numbers.
  factory ElevarmPasswordStrengthValidation.defaultContainsNumeric() {
    return ElevarmPasswordStrengthValidation(
      label: 'Kombinasi angka',
      validate: (password) => password.contains(RegExp(r'[0-9]')),
    );
  }

  /// Default validation for checking whether password input contains symbols.
  factory ElevarmPasswordStrengthValidation.defaultContainsSymbol() {
    return ElevarmPasswordStrengthValidation(
      label: 'Simbol',
      validate: (password) => password.contains(RegExp(r'(?=.*?[#?!@$%^&*-])')),
    );
  }

  /// Default validation for checking password input's minimum characters.
  factory ElevarmPasswordStrengthValidation.defaultMinCharacters() {
    return ElevarmPasswordStrengthValidation(
      label: 'Minimal 8 karakter',
      validate: (password) => password.length >= 8,
    );
  }

  /// Default validations for password input.
  static List<ElevarmPasswordStrengthValidation> getDefaults() {
    return [
      ElevarmPasswordStrengthValidation.defaultMinCharacters(),
      ElevarmPasswordStrengthValidation.defaultContainsUpperLowerCase(),
      ElevarmPasswordStrengthValidation.defaultContainsNumeric(),
      // ElevarmPasswordStrengthValidation.defaultContainsSymbol(),
    ];
  }
}

/// Elevarm UI's password strength component.
class ElevarmPasswordStrength extends StatelessWidget {
  /// The password input validations.
  final List<ElevarmPasswordStrengthValidation> validations;

  /// The check icon asset name.
  final IconData iconAssetName;

  /// The password input.
  final String password;

  /// The title text shown above the validations.
  final String title;

  /// String builder for password strength label.
  /// Parameter [strengthProgress] ranges from 0 to 1.
  final String Function(double strengthProgress)? passwordStrengthLabelBuilder;

  final bool showStrengthLabel;
  final bool showTitle;

  const ElevarmPasswordStrength({
    required this.password,
    required this.validations,
    this.title = 'Password harus mengandung:',
    this.iconAssetName = ElevarmIconsOutline.check_circle,
    this.passwordStrengthLabelBuilder,
    super.key,
    this.showStrengthLabel = false,
    this.showTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    double strengthProgress = _calculatePasswordStrength();
    String strengthLabel = passwordStrengthLabelBuilder != null
        ? passwordStrengthLabelBuilder!(strengthProgress)
        : _getPasswordStrengthLabel(strengthProgress);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showStrengthLabel) ...[
          Row(
            children: [
              Expanded(
                child: ElevarmLinearProgressIndicator(
                  value: strengthProgress,
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                strengthLabel,
                style: LibraryTextStyles.interSmMediumGrey700,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
        if (showTitle) ...[
          Text(
            title,
            style: LibraryTextStyles.interSmRegularNeutral300,
          ),
          const SizedBox(height: 16.0),
        ],
        ...validations.asMap().entries.map((entry) {
          final key = entry.key;
          final validation = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              validation.validate(password)
                  ? _buildValidRow(validation)
                  : _buildInvalidRow(validation),
              key < validations.length - 1
                  ? const SizedBox(height: 2.0)
                  : const SizedBox(),
            ],
          );
        }),
      ],
    );
  }

  /// Calculate password strength.
  double _calculatePasswordStrength() {
    if (validations.isEmpty) {
      return 0.0;
    }
    int countValid =
        validations.where((validation) => validation.validate(password)).length;
    return countValid / validations.length;
  }

  /// Get password strength label.
  String _getPasswordStrengthLabel(double strengthProgress) {
    if (strengthProgress <= 0.0) {
      return 'Very Weak';
    } else if (strengthProgress <= 0.25) {
      return 'Weak';
    } else if (strengthProgress <= 0.5) {
      return 'Medium';
    } else if (strengthProgress <= 0.75) {
      return 'Strong';
    } else {
      return 'Very Strong';
    }
  }

  /// Builds validation row that is valid.
  Widget _buildValidRow(ElevarmPasswordStrengthValidation validation) {
    return _buildValidationRow(
      iconColor: ElevarmColors.success,
      labelColor: ElevarmColors.success,
      label: validation.label,
    );
  }

  /// Builds validation row that is invalid.
  Widget _buildInvalidRow(ElevarmPasswordStrengthValidation validation) {
    return _buildValidationRow(
      iconColor: ElevarmColors.neutral300,
      labelColor: ElevarmColors.neutral300,
      label: validation.label,
    );
  }

  /// Builds a single validation row.
  Widget _buildValidationRow({
    required Color iconColor,
    required Color labelColor,
    required String label,
  }) {
    return Row(
      children: [
        ElevarmIcon(
          iconAssetName,
          color: iconColor,
          size: 12.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: ElevarmFontFamilies.inter(
            color: labelColor,
            fontWeight: ElevarmFontWeights.regular,
            fontSize: ElevarmFontSizes.xs,
          ),
        ),
      ],
    );
  }
}
