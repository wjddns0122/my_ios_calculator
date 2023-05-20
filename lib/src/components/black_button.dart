import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ios_calculator/src/constants/button_color.dart';
import 'package:my_ios_calculator/src/constants/button_size.dart';

enum Type { ROUND, FLAT }

class BlackButton extends StatelessWidget {
  final void Function()? onPressed;
  final String child;
  final Type type;
  const BlackButton(
      {super.key, this.onPressed, required this.type, required this.child});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case Type.ROUND:
        return _circle();
      case Type.FLAT:
        return _flat();
    }
  }

  Widget _circle() {
    return SizedBox(
      width: ButtonSize.short,
      height: ButtonSize.short,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(100),
        padding: const EdgeInsets.all(16.0),
        color: ButtonColor.black,
        onPressed: () {},
        child: Text(
          child,
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }

  Widget _flat() {
    return SizedBox(
      width: ButtonSize.long,
      height: ButtonSize.short,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(100),
        padding: const EdgeInsets.all(16.0),
        color: ButtonColor.black,
        onPressed: () {},
        child: Text(
          child,
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
