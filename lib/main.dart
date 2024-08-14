import 'package:crime_chart_app/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
          elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)))
      ),
      routerConfig: Routes.getAppRoutes(context),
    );
  }
}

