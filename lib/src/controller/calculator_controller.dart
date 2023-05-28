import 'package:flutter/src/gestures/drag_details.dart';
import 'package:get/get.dart';

enum Calculate { PLUS, MINUS, MULTIPLY, DIVIDE, NONE }

class CalculatorController extends GetxController {
  final RxString _result = RxString('0');
  num num1 = 0;
  num num2 = 0;
  Calculate status = Calculate.NONE;

  // get에서 초기화할 때 사용하는 obs
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

  // calcultate 에서 예시로 10.5+10.5=21.0이 나오는데 double형 데이터를 입력 받았을때 toInt형으로 받아주면 21로 바뀐다~
  void calculate() {
    num2 = num.parse(_result.value);
    num result = 0; // result 값을 초기화하는 변수

    switch (status) {
      case Calculate.PLUS:
        result = num1 + num2;
        break;
      case Calculate.MINUS:
        result = num1 - num2;
        break;
      case Calculate.MULTIPLY:
        result = num1 * num2;
        break;
      case Calculate.DIVIDE:
        if (num2 == 0) {
          _result.value = '오류';
          return;
        }
        result = num1 / num2;
        break;
      case Calculate.NONE:
        break;
    }

    // 만약 result값이 나머지가 0일때 int형 변수로 바꿔주고 아닐 경우 double형 변수로 바꿔준다.
    // _result 값은 private로 값이 변하기때문에 _result로 못한다
    if (result % 1 == 0) {
      _result.value = result.toInt().toString();
    } else {
      _result.value = result.toString();
    }
  }

  // _result값 숫자로 분리하여 num.parse함수에 사용 -> 곱하기 연산자 사용하고 문자열로 바꿔준다
  void convert() {
    _result.value = (num.parse(_result.value) * -1).toString();
  }

  void remove(DragUpdateDetails details) {
    // _result.value의 값을 초기화 하고 처음 값을 0으로 바꿔주는 함수
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
