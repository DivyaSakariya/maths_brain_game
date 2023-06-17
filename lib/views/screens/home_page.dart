import 'package:flutter/material.dart';
import 'package:maths_brain_game/utils/all_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> allSigns = ['➕', '➖', '✖', '➗'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maths Brain Game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: allSigns
                .map((e) => GestureDetector(
                      onTap: () {
                        (e == '➕')
                            ? Navigator.of(context).pushNamed(MyRoutes.sumPage)
                            : (e == '➖')
                                ? Navigator.of(context)
                                    .pushNamed(MyRoutes.subPage)
                                : (e == '✖')
                                    ? Navigator.of(context)
                                        .pushNamed(MyRoutes.multiPage)
                                    : Navigator.of(context)
                                        .pushNamed(MyRoutes.divPage);
                      },
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          child: Text(
                            "Click to play $e number game...!!",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
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
