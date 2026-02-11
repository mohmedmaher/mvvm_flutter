import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/routing/app_router.dart';
import 'package:mvvm_flutter/core/routing/routes.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
