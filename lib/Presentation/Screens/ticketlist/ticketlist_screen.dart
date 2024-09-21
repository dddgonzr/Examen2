import 'package:examen2_ticketavion/Presentation/widgets/maindrawer_widget.dart';
import 'package:flutter/material.dart';

class TicketlistScreen extends StatefulWidget {
  const TicketlistScreen({super.key});

  @override
  State<TicketlistScreen> createState() => _TicketlistScreenState();
}

class _TicketlistScreenState extends State<TicketlistScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text('Tu Lista de Tickets')),
      ),
      drawer: menuDrawer(context),
      body:Placeholder()

    );
  }
}