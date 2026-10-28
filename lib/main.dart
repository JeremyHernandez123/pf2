import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pf2/screens/home_screen.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/screens/widget_screen.dart';
import 'package:pf2/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      routes: {
        AppRoutes.home:(context) => HomePage(),
        AppRoutes.personal:(context) => PersonalScreen(),
        AppRoutes.widget:(context) => WidgetScreen()
      },
      initialRoute: AppRoutes.home,
    );
  }
}
