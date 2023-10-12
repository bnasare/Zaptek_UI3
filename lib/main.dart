import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/consts/theme.dart';
import 'package:restaurant/screens/bottom_appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData(context),
      home: const BottomBarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
