import 'package:flutter/cupertino.dart';

class ButtonIconType {
  static const double _iconSize = 35;
  static const Color _greyButtonColor = CupertinoColors.black;
  static const Color _orangeButtonColor = CupertinoColors.white;
  static const Color _orangeButtonColorReverse = CupertinoColors.activeOrange;

  static Icon get plusAndMinus => const Icon(
        CupertinoIcons.plus_slash_minus,
        size: _iconSize,
        color: _greyButtonColor,
      );

  static Icon get percent => const Icon(
        CupertinoIcons.percent,
        size: _iconSize,
        color: _greyButtonColor,
      );

  static Icon get plus => const Icon(
        CupertinoIcons.plus,
        size: _iconSize,
        color: _orangeButtonColor,
      );

  static Icon get plusReverse => const Icon(
        CupertinoIcons.plus,
        size: _iconSize,
        color: _orangeButtonColorReverse,
      );

  static Icon get minus => const Icon(
        CupertinoIcons.minus,
        size: _iconSize,
        color: _orangeButtonColor,
      );

  static Icon get minusReverse => const Icon(
        CupertinoIcons.minus,
        size: _iconSize,
        color: _orangeButtonColorReverse,
      );

  static Icon get multiply => const Icon(
        CupertinoIcons.multiply,
        size: _iconSize,
        color: _orangeButtonColor,
      );

  static Icon get multiplyReverse => const Icon(
        CupertinoIcons.multiply,
        size: _iconSize,
        color: _orangeButtonColorReverse,
      );

  static Icon get divide => const Icon(
        CupertinoIcons.divide,
        size: _iconSize,
        color: _orangeButtonColor,
      );

  static Icon get divideReverse => const Icon(
        CupertinoIcons.divide,
        size: _iconSize,
        color: _orangeButtonColorReverse,
      );

  static Icon get equal => const Icon(
        CupertinoIcons.equal,
        size: _iconSize,
        color: _orangeButtonColor,
      );

  static Text get allClear => const Text(
        'AC',
        style: TextStyle(
            fontSize: 35,
            color: CupertinoColors.black,
            fontWeight: FontWeight.w500),
      );

  static Text get clear => const Text(
        'C',
        style: TextStyle(
            fontSize: 35,
            color: CupertinoColors.black,
            fontWeight: FontWeight.w500),
      );
}
