import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stesh/constants.dart';
import 'package:stesh/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MaterialColor customColor = MaterialColor(0xFF880E4F, stesh_color);

    return MaterialApp(
      title: 'Stesh',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Constants.myDark,
            ),
      ),
      home: const IndexScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
