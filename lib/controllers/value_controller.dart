import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/all_routes.dart';

class ValueController extends ChangeNotifier {
  Random randomValue = Random();

  late int value1 = randomValue.nextInt(100);
  late int value2 = randomValue.nextInt(100);
  late int sum = value1 + value2;
  int score1 = 0;
  int score2 = 0;
  List opts = [];
  double progress = 0;
  String ans = "?";

  ValueController() {
    reload();
    getProgress();
  }

  void getProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      progress += 0.1;
      if (progress >= 1) {
        progress = 0;
        reload();
      }
      notifyListeners();
      getProgress();
    });
  }

  void reload() {
    value1 = randomValue.nextInt(100);
    value2 = randomValue.nextInt(100);
    sum = value1 + value2;
    progress = 0;
    opts.clear();
    ans = "?";

    opts.addAll([
      sum,
      (sum + randomValue.nextInt(10) + 1),
      (sum - randomValue.nextInt(10) - 1),
    ]);
    opts.shuffle();

    notifyListeners();
  }

  void check1({required int selectedOpt, required BuildContext context}) {
    if (sum == selectedOpt) {
      ans = sum.toString();
      score1++;
      reload();
    } else {
      if (score1 <= 0) {
        _showLossDialog(context);
        reload();
      } else {
        score1--;
      }
    }
    notifyListeners();
  }

  void check2({required int selectedOpt, required BuildContext context}) {
    if (sum == selectedOpt) {
      ans = sum.toString();
      score2++;
      reload();
    } else {
      if (score2 <= 0) {
        _showLossDialog(context);
        reload();
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
