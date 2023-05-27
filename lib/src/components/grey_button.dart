import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_ios_calculator/src/components/basic_button.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';
import 'package:my_ios_calculator/src/constants/button_size.dart';
import 'package:my_ios_calculator/src/constants/icon_data.dart';
import 'package:my_ios_calculator/src/controller/calculator_controller.dart';

enum GreyButtonType { ALLCLEAR, PLUSANDMINUS, PERCENT }

class GreyButton extends GetView<CalculatorController> {
  final GreyButtonType type;
  final Function() onPressed;
  const GreyButton({
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GreyButtonType.PLUSANDMINUS:
        return _buttonETC(ButtonIconType.plusAndMinus);
      case GreyButtonType.PERCENT:
        return _buttonETC(ButtonIconType.percent);
      case GreyButtonType.ALLCLEAR:
        return _buttonAllClear();
    }
  }

  Widget _buttonAllClear() {
    return SizedBox(
      width: ButtonSize.long,
      height: ButtonSize.long,
      child: Obx(
        () => CupertinoButton(
          onPressed: onPressed,
          color: ButtonColor.grey,
          padding: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(100),
          child: (controller.result == '0')
              ? ButtonIconType.allClear
              : ButtonIconType.clear,
        ),
      ),
    );
  }

  Widget _buttonETC(Icon icon) {
    return BasicButton(
        color: ButtonColor.grey, onPressed: onPressed, child: icon);
  }
}
