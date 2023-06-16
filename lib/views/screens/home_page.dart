import 'package:flutter/material.dart';
import 'package:maths_brain_game/utils/all_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> allSigns = ['+', '-', 'x', '➗'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maths Brain Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: allSigns
                .map((e) => GestureDetector(
                      onTap: () {
                        if (e == '+') {
                          Navigator.of(context).pushNamed(MyRoutes.sumPage);
                        } else if (e == '-') {
                          Navigator.of(context).pushNamed(MyRoutes.subPage);
                        }
                      },
                      child: Card(
                        child: Text(
                          "Click to play $e number game...!!",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
