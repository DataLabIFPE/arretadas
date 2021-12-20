import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String? text)? onChanged;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;

  const Input({
    Key? key,
    required this.label,
    this.icon,
    this.hint,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.textInputType,
    this.controller,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: this.label,
        hintText: this.hint,
        border: OutlineInputBorder(),
        suffixIcon: suffix,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
