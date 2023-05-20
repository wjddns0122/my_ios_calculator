import 'package:flutter/cupertino.dart';
import '../constants/button_color.dart';
import '../constants/button_size.dart';

class GreyButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const GreyButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonSize.short,
      height: ButtonSize.short,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(100),
        padding: const EdgeInsets.all(16.0),
        color: ButtonColor.grey,
        onPressed: () {},
        child: child,
      ),
    );
  }
}
