import 'package:examen2_ticketavion/Infrastructure/routers/main_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'Airplane Ticket Manager',
      theme:  ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      useMaterial3: true),
      routerConfig: mainRouter,
    );
  }
}
