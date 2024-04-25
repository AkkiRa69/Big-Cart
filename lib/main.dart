import 'package:flutter/material.dart';
import 'package:grocery_store/pages/intro_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FruitProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Color(0xFFF4F5F9)),
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
