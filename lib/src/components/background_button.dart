import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BackgroundButton extends StatelessWidget {
  const BackgroundButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonLength = Get.size.width / 4 - 15;
    return Container(
      width: buttonLength,
      height: buttonLength,
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
