import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';

import '../../ui/fonts.dart';

class CInputField extends StatelessWidget {
  const CInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.controller,
    required this.validator,
    this.onChanged
  });

  final String label;
  final String? hint;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        cursorColor: AppColors.primaryGrey,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: AppFonts.buildInputLabel(
            color: AppColors.primaryGrey
          ),
          filled: true,
          fillColor: AppColors.lightGrey,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryGrey, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryRed),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryIndigo, width: 2),
          ),
        ),
      ),
    );
  }
}
