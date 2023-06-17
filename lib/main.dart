import 'package:flutter/material.dart';
import 'package:maths_brain_game/controllers/value_controller.dart';
import 'package:maths_brain_game/utils/all_routes.dart';
import 'package:maths_brain_game/views/screens/div_page.dart';
import 'package:maths_brain_game/views/screens/home_page.dart';
import 'package:maths_brain_game/views/screens/multi_page.dart';
import 'package:maths_brain_game/views/screens/sub_page.dart';
import 'package:maths_brain_game/views/screens/sum_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ValueController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.sumPage: (context) => const SumPage(),
        MyRoutes.subPage: (context) => const SubPage(),
        MyRoutes.multiPage: (context) => const MultiPage(),
        MyRoutes.divPage: (context) => const DivPage(),
      },
    );
  }
}
