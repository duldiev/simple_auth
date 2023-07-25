import 'package:flutter/cupertino.dart';

class CupertinoButtonFilled extends StatelessWidget {
  const CupertinoButtonFilled({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(buttonTitle),
    );
  }
}
