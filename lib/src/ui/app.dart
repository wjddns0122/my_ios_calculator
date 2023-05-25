import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ios_calculator/src/components/black_button.dart';
import 'package:my_ios_calculator/src/components/grey_button.dart';
import 'package:my_ios_calculator/src/components/orange_buttion.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Column(
            children: [
              Expanded(flex: 3, child: _result()),
              Expanded(flex: 7, child: _button()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _result() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: SelectableText(
          '0',
          style: TextStyle(
              fontSize: 70, fontWeight: FontWeight.w200, color: Colors.white),
        ),
      ),
    );
  }

  Widget _button() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _firstRow(),
        _secondRow(),
        _thirdRow(),
        _fourthRow(),
        _fifthRow(),
      ],
    );
  }

  Widget _firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GreyButton(
          onPressed: () {},
          type: Type.ROUND,
          child: const Text(
            'AC',
            style: TextStyle(
                fontSize: 33, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        GreyButton(
          type: Type.ROUND,
          child: const Icon(
            CupertinoIcons.plus_slash_minus,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {},
        ),
        GreyButton(
            onPressed: () {},
            type: Type.ROUND,
            child: const Icon(
              CupertinoIcons.percent,
              color: Colors.black,
              size: 30,
            )),
        OrangeButton(
          isClick: false,
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.divide,
            color: ButtonColor.white,
            size: 35,
          ),
          activeIcon: Icon(
            CupertinoIcons.divide,
            color: ButtonColor.orange,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (const BlackButton(
          type: Type.ROUND,
          child: Text(
            '7',
            style: TextStyle(fontSize: 35),
          ),
        )),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '8',
            style: TextStyle(fontSize: 35),
          ),
        ),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '9',
            style: TextStyle(fontSize: 35),
          ),
        ),
        OrangeButton(
          isClick: false,
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.multiply,
            color: Colors.white,
            size: 35,
          ),
          activeIcon: const Icon(
            CupertinoIcons.multiply,
            color: Colors.orange,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _thirdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (const BlackButton(
          type: Type.ROUND,
          child: Text(
            '4',
            style: TextStyle(fontSize: 35),
          ),
        )),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '5',
            style: TextStyle(fontSize: 35),
          ),
        ),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '6',
            style: TextStyle(fontSize: 35),
          ),
        ),
        OrangeButton(
          isClick: false,
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.minus,
            color: Colors.white,
            size: 35,
          ),
          activeIcon: const Icon(
            CupertinoIcons.minus,
            color: Colors.orange,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _fourthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (const BlackButton(
          type: Type.ROUND,
          child: Text(
            '1',
            style: TextStyle(fontSize: 35),
          ),
        )),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '2',
            style: TextStyle(fontSize: 35),
          ),
        ),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '3',
            style: TextStyle(fontSize: 35),
          ),
        ),
        OrangeButton(
          isClick: false,
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.plus,
            color: Colors.white,
            size: 35,
          ),
          activeIcon: const Icon(
            CupertinoIcons.plus,
            color: Colors.orange,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _fifthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (BlackButton(
          type: Type.FLAT,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '0',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
          ),
        )),
        const BlackButton(
          type: Type.ROUND,
          child: Text(
            '.',
            style: TextStyle(fontSize: 35),
          ),
        ),
        OrangeButton(
          isClick: false,
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.equal,
            color: Colors.white,
            size: 35,
          ),
          activeIcon: const Icon(
            CupertinoIcons.equal,
            color: Colors.orange,
            size: 35,
          ),
        ),
      ],
    );
  }
}
