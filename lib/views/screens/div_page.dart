import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maths_brain_game/controllers/value_controller.dart';
import 'package:provider/provider.dart';

class DivPage extends StatelessWidget {
  const DivPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess The Divide Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ValueController>(builder: (context, provider, _) {
          return Column(
            children: [
              Expanded(
                child: Transform.rotate(
                  angle: pi * 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      LinearProgressIndicator(value: provider.progress),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Player 1",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Score: ${provider.score1}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              child: Text(
                                provider.value1.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              child: const Text("➗"),
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              child: Text(
                                provider.value2.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              child: const Text(
                                "=",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              child: Text(
                                provider.ans,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: provider.optDiv
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  provider.check1Div(
                                      selectedOpt: e, context: context);
                                },
                                child: Card(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 70,
                                    width: 70,
                                    child: Text(
                                      "$e",
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    LinearProgressIndicator(value: provider.progress),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Player 2",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Score: ${provider.score2}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            child: Text(
                              provider.value1.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            child: const Text("➗"),
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            child: Text(
                              provider.value2.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            child: const Text(
                              "=",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            child: Text(
                              provider.ans,
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: provider.optDiv
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                provider.check2Div(
                                    selectedOpt: e, context: context);
                              },
                              child: Card(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width: 70,
                                  child: Text(
                                    "$e",
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
