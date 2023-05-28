// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:my_ios_calculator/src/components/basic_button.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';
import 'package:my_ios_calculator/src/constants/icon_data.dart';

class EqualButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EqualButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BasicButton(
        color: ButtonColor.orange,
        onPressed: onPressed,
        child: ButtonIconType.equal,
      ),
    );
  }
}
