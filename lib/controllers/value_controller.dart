import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/all_routes.dart';

class ValueController extends ChangeNotifier {
  Random randomValue = Random();

  late int value1 = randomValue.nextInt(100);
  late int value2 = randomValue.nextInt(100);
  late int sum = value1 + value2;
  late int sub = value1 - value2;
  late int multi = value1 * value2;
  late double div = value1 / value2;
  int divInt = 0;
  int score1 = 0;
  int score2 = 0;
  List optSum = [];
  List optSub = [];
  List optMulti = [];
  List optDiv = [];
  double progress = 0;
  String ans = "?";

  ValueController() {
    reloadSum();
    reloadSub();
    reloadMulti();
    reloadDiv();
    getProgress();
  }

  void getProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      progress += 0.1;
      if (progress >= 1) {
        progress = 0;
        reloadSum();
        reloadSub();
        reloadMulti();
        reloadDiv();
      }
      notifyListeners();
      getProgress();
    });
  }

  void reloadSum() {
    value1 = randomValue.nextInt(100);
    value2 = randomValue.nextInt(100);
    sum = value1 + value2;
    progress = 0;
    optSum.clear();
    ans = "?";

    optSum.addAll([
      sum,
      (sum + randomValue.nextInt(10) + 1),
      (sum - randomValue.nextInt(10) - 1),
    ]);
    optSum.shuffle();

    notifyListeners();
  }

  void check1Sum({required int selectedOpt, required BuildContext context}) {
    if (sum == selectedOpt) {
      ans = sum.toString();
      score1++;
      reloadSum();
    } else {
      if (score1 <= 0) {
        _showLossDialog(context);
        reloadSum();
      } else {
        score1--;
      }
    }
    notifyListeners();
  }

  void check2Sum({required int selectedOpt, required BuildContext context}) {
    if (sum == selectedOpt) {
      ans = sum.toString();
      score2++;
      reloadSum();
    } else {
      if (score2 <= 0) {
        _showLossDialog(context);
        reloadSum();
      } else {
        score2--;
      }
    }
    notifyListeners();
  }

  void reloadSub() {
    value1 = randomValue.nextInt(100);
    value2 = randomValue.nextInt(100);
    sub = value1 - value2;
    progress = 0;
    optSub.clear();
    ans = "?";

    optSub.addAll([
      sub,
      (sub + randomValue.nextInt(10) + 1),
      (sub - randomValue.nextInt(10) - 1),
    ]);
    optSub.shuffle();

    notifyListeners();
  }

  void check1Sub({required int selectedOpt, required BuildContext context}) {
    if (sub == selectedOpt) {
      ans = sub.toString();
      score1++;
      reloadSub();
    } else {
      if (score1 < 0) {
        _showLossDialog(context);
        reloadSub();
      } else {
        score1--;
      }
    }
    notifyListeners();
  }

  void check2Sub({required int selectedOpt, required BuildContext context}) {
    if (sub == selectedOpt) {
      ans = sub.toString();
      score2++;
      reloadSub();
    } else {
      if (score2 <= 0) {
        _showLossDialog(context);
        reloadSub();
      } else {
        score2--;
      }
    }
    notifyListeners();
  }

  void reloadMulti() {
    value1 = randomValue.nextInt(50);
    value2 = randomValue.nextInt(50);
    multi = value1 * value2;
    progress = 0;
    optMulti.clear();
    ans = "?";

    optMulti.addAll([
      multi,
      (multi + randomValue.nextInt(10) + 1),
      (multi - randomValue.nextInt(10) - 1),
    ]);
    optMulti.shuffle();

    notifyListeners();
  }

  void check1Multi({required int selectedOpt, required BuildContext context}) {
    if (multi == selectedOpt) {
      ans = multi.toString();
      score1++;
      reloadMulti();
    } else {
      if (score1 <= 0) {
        _showLossDialog(context);
        reloadMulti();
      } else {
        score1--;
      }
    }
    notifyListeners();
  }

  void check2Multi({required int selectedOpt, required BuildContext context}) {
    if (multi == selectedOpt) {
      ans = multi.toString();
      score2++;
      reloadMulti();
    } else {
      if (score2 <= 0) {
        _showLossDialog(context);
        reloadMulti();
      } else {
        score2--;
      }
    }
    notifyListeners();
  }

  void reloadDiv() {
    value1 = randomValue.nextInt(50);
    value2 = randomValue.nextInt(50);
    div = value1 / value2;
    divInt = div.toInt();
    progress = 0;
    optDiv.clear();
    ans = "?";

    optDiv.addAll([
      divInt,
      (divInt + randomValue.nextInt(10) + 1),
      (divInt - randomValue.nextInt(10) - 1),
    ]);
    optDiv.shuffle();

    notifyListeners();
  }

  void check1Div({required int selectedOpt, required BuildContext context}) {
    if (divInt == selectedOpt) {
      ans = divInt.toString();
      score1++;
      reloadDiv();
    } else {
      if (score1 <= 0) {
        _showLossDialog(context);
        reloadDiv();
      } else {
        score1--;
      }
    }
    notifyListeners();
  }

  void check2Div({required int selectedOpt, required BuildContext context}) {
    if (divInt == selectedOpt) {
      ans = divInt.toString();
      score2++;
      reloadDiv();
    } else {
      if (score2 <= 0) {
        _showLossDialog(context);
        reloadDiv();
      } else {
        score2--;
      }
    }
    notifyListeners();
  }

  void _showLossDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("You Loss This Game...!!"),
        actions: [
          MaterialButton(
            onPressed: () {
              _clearScoreBoard();
              Navigator.of(context).pop();
            },
            child: const Text("Play Again"),
          ),
          MaterialButton(
            onPressed: () {
              _clearScoreBoard();
              Navigator.of(context).pushNamed(MyRoutes.home);
            },
            child: const Text("Home"),
          ),
        ],
      ),
    );
    notifyListeners();
  }

  void _clearScoreBoard() {
    score1 = 0;
    score2 = 0;
    notifyListeners();
  }
}
