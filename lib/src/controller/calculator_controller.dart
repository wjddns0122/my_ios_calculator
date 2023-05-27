import 'package:flutter/src/gestures/drag_details.dart';
import 'package:get/get.dart';

enum Calculate { PLUS, MINUS, MULTIPLY, DIVIDE, NONE }

class CalculatorController extends GetxController {
  final RxString _result = '0'.obs;
  num num1 = 0;
  num num2 = 0;
  Calculate status = Calculate.NONE;

  bool pushCalculateButton = false;
  final RxBool _initStatus = true.obs;
  final RxBool _pushPlus = false.obs;
  final RxBool _pushMinus = false.obs;
  final RxBool _pushMultiply = false.obs;
  final RxBool _pushDivide = false.obs;

  String get result => _result.value;
  bool get init => _initStatus.value;
  bool get plus => _pushPlus.value;
  bool get minus => _pushMinus.value;
  bool get multiply => _pushMultiply.value;
  bool get divide => _pushDivide.value;

  void allClear() {
    initPushCalculateStatus();
    initResultNumber();
    num1 = 0;
    num2 = 0;
    status = Calculate.NONE;
  }

  void initPushCalculateStatus() {
    _pushPlus.value = false;
    _pushMinus.value = false;
    _pushMultiply.value = false;
    _pushDivide.value = false;
  }

  void initResultNumber() {
    _result.value = '0';
  }

  void pushNumberButton(String value) {
    if (pushCalculateButton) {
      initResultNumber();
      initPushCalculateStatus();
      pushCalculateButton = false;
    }

    if (_result.value[0] == '0' && _result.value.length == 1) {
      _result.value = '';
    }
    _result.value += value;
  }

  void pushCalculateButtonProgress(Calculate type) {
    num1 = num.parse(_result.value);
    initPushCalculateStatus();

    switch (type) {
      case Calculate.PLUS:
        _pushPlus.value = true;
        break;
      case Calculate.MINUS:
        _pushMinus.value = true;
        break;
      case Calculate.MULTIPLY:
        _pushMultiply.value = true;
        break;
      case Calculate.DIVIDE:
        _pushDivide.value = true;
        break;
      case Calculate.NONE:
        break;
    }
    pushCalculateButton = true;
  }

  void pushPlusButton() {
    status = Calculate.PLUS;
    pushCalculateButtonProgress(status);
  }

  void pushMinusButton() {
    status = Calculate.MINUS;
    pushCalculateButtonProgress(status);
  }

  void pushMultiplyButton() {
    status = Calculate.MULTIPLY;
    pushCalculateButtonProgress(status);
  }

  void pushDivideButton() {
    status = Calculate.DIVIDE;
    pushCalculateButtonProgress(status);
  }

  void pushDotButton() {
    if (_result.value.contains('.')) {
      return;
    }
    _result.value += '.';
  }

  void changeToPercent() {
    _result.value = (num.parse(_result.value) / 100).toString();
  }

  void calculate() {
    num2 = num.parse(_result.value);
    switch (status) {
      case Calculate.PLUS:
        _result.value = (num1 + num2).toString();
        break;
      case Calculate.MINUS:
        _result.value = (num1 - num2).toString();
        break;
      case Calculate.MULTIPLY:
        _result.value = (num1 * num2).toString();
        break;
      case Calculate.DIVIDE:
        if (num2 == 0) {
          _result.value = '오류';
          return;
        }
        _result.value = (num1 / num2).toString();
        break;
      case Calculate.NONE:
        break;
    }
  }

  void convert() {
    _result.value = (num.parse(_result.value) * -1).toString();
  }

  void remove(DragUpdateDetails details) {
    if (_result.value.length > 1 && _result.value != '0') {
      _result.value = _result.value.substring(0, _result.value.length - 1);
      return;
    }

    if (_result.value.length == 1 && _result.value != '0') {
      initResultNumber();
      return;
    }
  }
}
