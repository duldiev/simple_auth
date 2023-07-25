import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CupertinoInputField extends StatefulWidget {
  const CupertinoInputField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    required this.placeholder,
    this.keyboardType,
    this.obsecure = false,
  });

  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String placeholder;
  final TextInputType? keyboardType;
  final bool obsecure;

  @override
  State<CupertinoInputField> createState() => _CupertinoInputFieldState();
}

class _CupertinoInputFieldState extends State<CupertinoInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: widget.obsecure,
      placeholder: widget.placeholder,
      controller: _controller,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      keyboardType: widget.keyboardType,
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 4.w,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const BoxDecoration(),
    );
  }
}
