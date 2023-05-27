import 'package:flutter/cupertino.dart';

import '../constants/button_color.dart';
import '../constants/button_size.dart';

class OrangeButton extends StatelessWidget {
  final void Function() onPressed;
  final Icon iconFront;
  final Icon iconBack;
  final bool isClicked;
  const OrangeButton({
    super.key,
    required this.onPressed,
    required this.iconFront,
    required this.iconBack,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backButton(),
        _frontButton(),
      ],
    );
  }

  Widget _frontButton() {
    return AnimatedOpacity(
      opacity: (isClicked) ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        width: ButtonSize.short,
        height: ButtonSize.short,
        child: CupertinoButton(
          pressedOpacity: null,
          borderRadius: BorderRadius.circular(100),
          padding: const EdgeInsets.all(8.0),
          color: ButtonColor.orange,
          onPressed: onPressed,
          child: iconFront,
        ),
      ),
    );
  }

  Widget _backButton() {
    return SizedBox(
      width: ButtonSize.short,
      height: ButtonSize.short,
      child: CupertinoButton(
        pressedOpacity: 1.0,
        borderRadius: BorderRadius.circular(100),
        padding: const EdgeInsets.all(8.0),
        color: ButtonColor.white,
        onPressed: onPressed,
        child: iconBack,
      ),
    );
  }
}
