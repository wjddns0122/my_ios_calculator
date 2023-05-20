import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ios_calculator/src/components/black_button.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlackButton(
          onPressed: () {},
          type: Type.FLAT,
          child: '0',
        ),
        BlackButton(
          type: Type.ROUND,
          child: '.',
          onPressed: () {},
        ),
        OrangeButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.add,
              color: ButtonColor.white,
              size: 35,
            ),
            activeIcon: Icon(
              CupertinoIcons.add,
              color: ButtonColor.orange,
              size: 35,
            ))
      ],
    );
  }

  Widget _secondRow() {
    return Container();
  }

  Widget _thirdRow() {
    return Container();
  }

  Widget _fourthRow() {
    return Container();
  }

  Widget _fifthRow() {
    return Container();
  }
}
