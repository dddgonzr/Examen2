import 'package:examen2_ticketavion/Infrastructure/common/themes/maintheme_theme.dart';
import 'package:examen2_ticketavion/Infrastructure/routers/main_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';




void main() async {

WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options: const FirebaseOptions(
  apiKey: "AIzaSyB4DdSIkiHQ6CqeIq32lt_RUiovRzo33_M",
  authDomain: "ticketavion-6887b.firebaseapp.com",
  projectId: "ticketavion-6887b",
  storageBucket: "ticketavion-6887b.appspot.com",
  messagingSenderId: "1022042698843",
  appId: "1:1022042698843:web:28d7f5c49a20bb84077b7e"
    ),
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'Airplane Ticket Manager',
      theme:  theme,
      routerConfig: mainRouter,
    );
  }
}
