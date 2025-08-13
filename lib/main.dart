import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api_project/view/splash_screen.dart';
import 'package:test_login_api_project/view_model/auth_provider.dart';
import 'package:test_login_api_project/view_model/weather_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplaceScreen(),
    );
  }
}