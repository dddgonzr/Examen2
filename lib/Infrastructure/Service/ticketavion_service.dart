
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen2_ticketavion/Models/ticketAvion_model.dart';


Future<List<TicketAvion>> getTickets() async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return TicketAvion(
        ticketId: data['ticketId'],
        aerolinea: data['aerolinea'],
        numvuelo: data['numvuelo'],
        pasajero: data['pasajero'],
        origen: data['origen'],
        destino: data['destino'],
      );
    }).toList();
  } catch (e) {
    throw Exception('Error retrieving tickets: $e');
  }
}


Future<TicketAvion?> getTicketbyId(String documentId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('tickets')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return TicketAvion(
          ticketId: data['ticketId'],
          aerolinea: data['aerolinea'],
          numvuelo: data['numvuelo'],
          pasajero: data['pasajero'],
          origen: data['origen'],
          destino: data['destino'],
        );
      }
      return null; 
    } catch (e) {
      throw Exception('Error retrieving ticket: $e');
    }
  }

  


Future<DocumentReference> addTicket(TicketAvion ticket) async {
    try {
      return await FirebaseFirestore.instance
          .collection('tickets')
          .add(ticket.toMap());
    } catch (e) {
      throw Exception('Error adding ticket: $e');
    }
  }

  
  Future<void> updateTicketbyId(String documentId, TicketAvion ticket) async {
    try {
      await FirebaseFirestore.instance
          .collection('tickets')
          .doc(documentId)
          .update(ticket.toMap());
    } catch (e) {
      throw Exception('Error updating ticket: $e');
    }
  }

  
   Future<void> deleteTicketnyId(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('tickets')
          .doc(documentId)
          .delete();
    } catch (e) {
      throw Exception('Error deleting ticket: $e');
    }
  }
