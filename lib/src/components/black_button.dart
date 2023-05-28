import 'package:flutter/cupertino.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';
import 'package:my_ios_calculator/src/components/basic_button.dart';

enum BlackButtonType {
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  ZER0,
  DOT
}

class BlackButton extends StatelessWidget {
  final BlackButtonType type;
  final Function() onPressed;
  const BlackButton({
    super.key,
    required this.type,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BlackButtonType.ONE:
        return _numberButton('1');

      case BlackButtonType.TWO:
        return _numberButton('2');

      case BlackButtonType.THREE:
        return _numberButton('3');

      case BlackButtonType.FOUR:
        return _numberButton('4');

      case BlackButtonType.FIVE:
        return _numberButton('5');

      case BlackButtonType.SIX:
        return _numberButton('6');

      case BlackButtonType.SEVEN:
        return _numberButton('7');

      case BlackButtonType.EIGHT:
        return _numberButton('8');

      case BlackButtonType.NINE:
        return _numberButton('9');

      case BlackButtonType.ZER0:
        return _zeroButton('0');

      case BlackButtonType.DOT:
        return _numberButton('.');
    }
  }

  Widget _numberButton(String number) {
    return BasicButton(
        color: ButtonColor.black,
        onPressed: onPressed,
        child: _numberText(number));
  }

  Widget _zeroButton(String number) {
    return SizedBox(
      height: 80,
      width: 180,
      child: BasicButton(
          color: ButtonColor.black,
          onPressed: onPressed,
          child: _zeroNumberText(number)),
    );
  }

  Widget _numberText(String number) {
    return Text(
      number,
      style: const TextStyle(fontSize: 35, color: CupertinoColors.white),
    );
  }

  Widget _zeroNumberText(String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 35, color: CupertinoColors.white),
          ),
        ],
      ),
    );
  }
}
