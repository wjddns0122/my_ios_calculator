import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ios_calculator/src/components/black_button.dart';
import 'package:my_ios_calculator/src/components/equal_button.dart';
import 'package:my_ios_calculator/src/components/grey_button.dart';
import 'package:my_ios_calculator/src/components/orange_buttion.dart';
import 'package:my_ios_calculator/src/constants/icon_data.dart';
import 'package:my_ios_calculator/src/constants/view_ratio.dart';
import 'package:my_ios_calculator/src/controller/calculator_controller.dart';

class App extends GetView<CalculatorController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Flexible(
              flex: ViewRatio.ratio['top']!,
              child: _result(),
            ),
            Flexible(
              flex: ViewRatio.ratio['bottom']!,
              child: _button(),
            )
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _firstRow(), // 첫번째 줄
        _secondRow(), // 두번째 줄
        _thirdRow(), // 세번째 줄
        _fourthRow(), // 내번째 줄
        _fifthRow(), // 다섯번째 줄
      ],
    );
  }

  Widget _result() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.bottomRight,
        child: Obx(
          () => Text(
            controller.result,
            style: const TextStyle(
                color: Colors.white, fontSize: 80, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  // 버튼 첫번째 줄
  Widget _firstRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GreyButton(
              type: GreyButtonType.ALLCLEAR, onPressed: controller.allClear),
          GreyButton(
              type: GreyButtonType.PLUSANDMINUS, onPressed: controller.convert),
          GreyButton(
              type: GreyButtonType.PERCENT,
              onPressed: controller.changeToPercent),
          Obx(
            () => OrangeButton(
              iconFront: ButtonIconType.divide,
              iconBack: ButtonIconType.divideReverse,
              isClicked: controller.divide,
              onPressed: controller.pushDivideButton,
            ),
          ),
        ],
      ),
    );
  }

  // 버튼 두번쨰 줄
  Widget _secondRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackButton(
            type: BlackButtonType.SEVEN,
            onPressed: () => controller.pushNumberButton('7'),
          ),
          BlackButton(
            type: BlackButtonType.EIGHT,
            onPressed: () => controller.pushNumberButton('8'),
          ),
          BlackButton(
            type: BlackButtonType.NINE,
            onPressed: () => controller.pushNumberButton('9'),
          ),
          Obx(
            () => OrangeButton(
              iconFront: ButtonIconType.multiply,
              iconBack: ButtonIconType.multiplyReverse,
              isClicked: controller.multiply,
              onPressed: controller.pushMultiplyButton,
            ),
          ),
        ],
      ),
    );
  }

  // 버튼 새번쨰 줄
  Widget _thirdRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackButton(
            type: BlackButtonType.FOUR,
            onPressed: () => controller.pushNumberButton('4'),
          ),
          BlackButton(
            type: BlackButtonType.FIVE,
            onPressed: () => controller.pushNumberButton('5'),
          ),
          BlackButton(
            type: BlackButtonType.SIX,
            onPressed: () => controller.pushNumberButton('6'),
          ),
          Obx(
            () => OrangeButton(
              iconFront: ButtonIconType.minus,
              iconBack: ButtonIconType.minusReverse,
              isClicked: controller.minus,
              onPressed: controller.pushMinusButton,
            ),
          ),
        ],
      ),
    );
  }

  // 버튼 네번째 줄
  Widget _fourthRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackButton(
            type: BlackButtonType.ONE,
            onPressed: () => controller.pushNumberButton('1'),
          ),
          BlackButton(
            type: BlackButtonType.TWO,
            onPressed: () => controller.pushNumberButton('2'),
          ),
          BlackButton(
            type: BlackButtonType.THREE,
            onPressed: () => controller.pushNumberButton('3'),
          ),
          Obx(
            () => OrangeButton(
              iconFront: ButtonIconType.plus,
              iconBack: ButtonIconType.plusReverse,
              isClicked: controller.plus,
              onPressed: controller.pushPlusButton,
            ),
          ),
        ],
      ),
    );
  }

  // 버튼 다섯번쨰 줄
  Widget _fifthRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackButton(
            type: BlackButtonType.ZER0,
            onPressed: () => controller.pushNumberButton('0'),
          ),
          BlackButton(
            type: BlackButtonType.DOT,
            onPressed: () => controller.pushDotButton,
          ),
          EqualButton(onPressed: controller.calculate)
        ],
      ),
    );
  }
}
