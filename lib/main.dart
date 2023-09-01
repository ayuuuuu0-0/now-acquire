import 'package:flutter/material.dart';
import 'package:now_acquire_app/SplashScreen/SplashScreen.dart';
import 'package:now_acquire_app/startup_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final StartupProvider startupProvider = StartupProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StartupProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(),
    ),
    );
  }
}

