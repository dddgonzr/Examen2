
import 'package:examen2_ticketavion/Infrastructure/Service/ticketavion_service.dart';
import 'package:examen2_ticketavion/Infrastructure/common/styles/allstyles_style.dart';
import 'package:examen2_ticketavion/Models/ticketAvion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TicketForm extends StatefulWidget {
  const TicketForm({super.key});

  @override
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {

  final TextEditingController ticketIdController = TextEditingController();
  final TextEditingController aerolineaController = TextEditingController();
  final TextEditingController numvueloController = TextEditingController();
  final TextEditingController pasajeroController = TextEditingController();
  final TextEditingController origenController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();

  void clearTextFields() {
    ticketIdController.clear();
    aerolineaController.clear();
    numvueloController.clear();
    pasajeroController.clear();
    origenController.clear();
    destinoController.clear();
  }

void createTicket() async {
 
  if (ticketIdController.text.isNotEmpty &&
    aerolineaController.text.isNotEmpty &&
    numvueloController.text.isNotEmpty &&
    pasajeroController.text.isNotEmpty &&
    origenController.text.isNotEmpty &&
    destinoController.text.isNotEmpty) {
  
 
  final newTicket = TicketAvion(
  ticketId: ticketIdController.text,
  aerolinea: aerolineaController.text,
  numvuelo: int.tryParse(numvueloController.text) ?? 0,
  pasajero: pasajeroController.text,
  origen: origenController.text,
  destino: destinoController.text);

  try {
  
    await addTicket(newTicket);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ticket creado con éxito')),
    );
   setState(() {
     clearTextFields();
   }); 
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al crear el ticket: $e')),
    );
  }
} else

 {   

  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Por favor, complete todos los campos.')),
      );
    }
}

void readTicket() async {
  
  if (ticketIdController.text.isNotEmpty){
    String id = ticketIdController.text;
  try {
    TicketAvion ticket = await getTicketbyId(id);
    if (ticket.aerolinea.isNotEmpty) {
      setState(() {
        ticketIdController.text = ticket.ticketId;
        aerolineaController.text = ticket.aerolinea;
        numvueloController.text = ticket.numvuelo.toString();
        pasajeroController.text = ticket.pasajero;
        origenController.text = ticket.origen;
        destinoController.text = ticket.destino;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ticket cargado con éxito'))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ticket no encontrado')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al leer el ticket: $e')),
    );
  }}
  else {
       ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Porfavor Ingrese un Ticket ID')),
      );
  }
}


void updateTicket() async {
  
  if(ticketIdController.text.isNotEmpty &&
    aerolineaController.text.isNotEmpty &&
    numvueloController.text.isNotEmpty &&
    pasajeroController.text.isNotEmpty &&
    origenController.text.isNotEmpty &&
    destinoController.text.isNotEmpty) {
  
  final updatedTicket = TicketAvion(
  ticketId: ticketIdController.text,
  aerolinea: aerolineaController.text,
  numvuelo: int.tryParse(numvueloController.text) ?? 0,
  pasajero: pasajeroController.text,
  origen: origenController.text,
  destino: destinoController.text);

  try {
    await updateTicketById(updatedTicket.ticketId, updatedTicket);
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('Ticket actualizado con éxito')),
    );
    clearTextFields();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al actualizar el ticket: $e')),
    );
  }
} else { ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('Favor llene todos los campos')),
    ); }
}

void deleteTicket() async {
  
  if(ticketIdController.text.isNotEmpty){

    final id = ticketIdController.text;

  try {
    await deleteTicketyId(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ticket eliminado con éxito')),
    );
    setState(() {
     clearTextFields();
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al eliminar el ticket: $e')),
    );
  }
} else {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favor Ingresar Id de Ticket que desea Eliminar')),
    );
}}
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: ticketIdController,
              decoration: const InputDecoration(
                labelText: 'Ticket ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: aerolineaController,
              decoration: const InputDecoration(
                labelText: 'Aerolínea',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numvueloController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Número de Vuelo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pasajeroController,
              decoration: const InputDecoration(
                labelText: 'Pasajero',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: origenController,
              decoration: const InputDecoration(
                labelText: 'Origen',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: destinoController,
              decoration: const InputDecoration(
                labelText: 'Destino',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    createTicket();
                  },
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black),
                  child: const Text('Agregar', style: buttonFont ),
                ),
                ElevatedButton(
                  onPressed: () {
                    readTicket();
                  },
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black),
                  child: const Text('Buscar', style: buttonFont ),
                ),
                ElevatedButton(
                  onPressed: () {
                   updateTicket();
                  },
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black),
                  child: const Text('Actualizar', style: buttonFont, ),
                ),
                ElevatedButton(
                  onPressed: () {
                   deleteTicket();
                  },
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black),
                  child: const Text('Eliminar', style: buttonFont, ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}