import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_ipix/view/splash_screens/splash_screen.dart';
import 'package:restaurant_app_ipix/view_model/details_screen.dart';
import 'package:restaurant_app_ipix/view_model/login_page_controller.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';

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
          create: (context) => SplashScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsScreenController(),
        ),
      ],
      child: MaterialApp(
        title: 'Restaraunt app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
