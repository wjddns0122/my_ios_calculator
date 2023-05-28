import 'package:flutter/cupertino.dart';
import 'package:my_ios_calculator/src/constants/button_size.dart';

// ignore: constant_identifier_names
enum ButtonShape { CIRCLE, FLAT }

class BasicButton extends StatelessWidget {
  final ButtonShape? shape;
  final Color color;
  final Widget child;
  final Function() onPressed;
  const BasicButton(
      {super.key,
      this.shape = ButtonShape.CIRCLE,
      required this.color,
      required this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case ButtonShape.CIRCLE:
        return _button(ButtonSize.long, ButtonSize.long);
      case ButtonShape.FLAT:
        return _button(ButtonSize.long, ButtonSize.short);
      default:
        return Container();
    }
  }

  Widget _button(double height, double width) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
        color: color,
        padding: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(100),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
