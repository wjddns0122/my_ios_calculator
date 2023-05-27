import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ios_calculator/src/components/basic_button.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';
import 'package:my_ios_calculator/src/constants/icon_data.dart';

class EqualButton extends StatelessWidget {
  final Function() onPressed;
  const EqualButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BasicButton(
      color: ButtonColor.orange,
      onPressed: onPressed,
      child: ButtonIconType.equal,
    );
  }
}
