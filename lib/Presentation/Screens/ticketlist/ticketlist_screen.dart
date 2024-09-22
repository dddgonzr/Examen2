import 'package:examen2_ticketavion/Infrastructure/Service/ticketavion_service.dart';
import 'package:examen2_ticketavion/Models/ticketAvion_model.dart';
import 'package:examen2_ticketavion/Presentation/widgets/maindrawer_widget.dart';
import 'package:flutter/material.dart';

class TicketlistScreen extends StatefulWidget {
  const TicketlistScreen({super.key});

  @override
  State<TicketlistScreen> createState() => _TicketlistScreenState();
}

class _TicketlistScreenState extends State<TicketlistScreen> {
  Future<List<TicketAvion>> futureTickets = getTickets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tu Lista de Tickets')),
      ),
      drawer: menuDrawer(context),
      body: FutureBuilder<List<TicketAvion>>(
        future: futureTickets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay tickets disponibles.'));
          } else {
            final tickets = snapshot.data!;
            return ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1), 
                    borderRadius: BorderRadius.circular(4.0), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      '${ticket.aerolinea} - ${ticket.numvuelo}',
                      style: const TextStyle(fontSize: 18.0), 
                    ),
                    subtitle: Text(
                      'Pasajero: ${ticket.pasajero}\n'
                      'Origen: ${ticket.origen} - Destino: ${ticket.destino}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.airplanemode_active), 
                        const SizedBox(width: 4), 
                        Text(
                          ticket.ticketId,
                          style: const TextStyle(fontWeight: FontWeight.bold), 
                        ),
                      ],
                    ),
                    onTap: () {
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
