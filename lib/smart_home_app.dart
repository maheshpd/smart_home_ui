import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_ui/smart_home_main_page.dart';
import 'package:smart_home_ui/smart_lighting_page.dart';

class SmartHomeApp extends StatelessWidget {
  SmartHomeApp({super.key});
  final _route = GoRouter(
    initialLocation: "/",
    routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SmartHomeMainPage(),
    ),
    GoRoute(path: "/light", builder: (context, state) => const SmartLightingPage())
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _route,
      theme: ThemeData.light(
        // useMaterial3: true
      ),
    );
  }
}
