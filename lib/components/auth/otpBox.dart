import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:together_test/constants/colors.dart';

otpBox(
  TextEditingController controller,
  FocusNode currentFocus,
  FocusNode? nextFocus,
) {
  return SizedBox(
    width: 55,
    child: TextField(
      onChanged: (value) {
        if (value.length == 1 && nextFocus != null) {
          FocusScope.of(currentFocus.context!).requestFocus(nextFocus);
        }
      },
      focusNode: currentFocus,
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 1,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: AppColors.primary),
      decoration: InputDecoration(
        counterText: "",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.error0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
      cursorColor: AppColors.primary,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    ),
  );
}
