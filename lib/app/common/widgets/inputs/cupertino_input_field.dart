import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CupertinoInputField extends StatelessWidget {
  const CupertinoInputField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    required this.placeholder,
    this.controller,
    this.keyboardType,
    this.obsecure = false,
  });

  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: obsecure,
      placeholder: placeholder,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 4.w,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const BoxDecoration(),
    );
  }
}
