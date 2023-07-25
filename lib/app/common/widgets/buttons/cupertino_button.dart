import 'package:flutter/cupertino.dart';

class CupertinoButtonDefault extends StatelessWidget {
  const CupertinoButtonDefault({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.alignment = Alignment.center,
    this.titleColor,
  });

  final String buttonTitle;
  final VoidCallback onPressed;
  final Alignment alignment;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      alignment: alignment,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: titleColor,
        ),
      ),
    );
  }
}
