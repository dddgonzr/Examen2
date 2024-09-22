
import 'package:examen2_ticketavion/Infrastructure/common/styles/allstyles_style.dart';
import 'package:examen2_ticketavion/Presentation/widgets/ticketform_widget.dart';
import 'package:examen2_ticketavion/Presentation/widgets/maindrawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text('Airplane Ticket Manager', style: HeadertextStyle)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      drawer: menuDrawer(context),
      body: const TicketForm(),
    );
  }
}