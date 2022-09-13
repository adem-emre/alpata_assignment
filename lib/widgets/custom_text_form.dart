import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {
  final TextStyle? textStyle;
  final int? maxLines;
  final bool passwordMode;
  final int? maxLength;
  final String hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final void Function(String?)? onSaved;
  final String? initialValue;

  const CustomTextForm({
    this.maxLines = 1,
    this.passwordMode = false,
    required this.hintText,
    this.prefixIcon,
    Key? key,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.padding,
    this.textStyle,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 21),
      child: Material(
        elevation: 4,
        child: TextFormField(
          initialValue: initialValue,
          onSaved: onSaved,
          style: textStyle,
          maxLines: maxLines,
          obscureText: passwordMode,
          maxLength: maxLength,
          keyboardType: keyboardType,
          validator: validator,
          inputFormatters: keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
              errorMaxLines: 2,
              prefixIcon: prefixIcon,
              hintText: hintText,
              counterText: ""),
        ),
      ),
    );
  }
}
