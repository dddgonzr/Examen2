
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


Future<TicketAvion> getTicketbyId(String id) async {

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('tickets')
          .where('ticketId', isEqualTo: id)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();
    return TicketAvion(
      ticketId: data['ticketId'],
      aerolinea: data['aerolinea'],
      numvuelo: data['numvuelo'],
      pasajero: data['pasajero'],
      origen: data['origen'],
      destino: data['destino'],
    );
  } else {
    throw Exception('Error retrieving ticket: No ticket found with the provided ID');
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

  
 Future<void> updateTicketById(String ticketId, TicketAvion updatedTicket) async {
  try {

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .where('ticketId', isEqualTo: ticketId)
        .get();

    if (snapshot.docs.isNotEmpty) {
     
      DocumentReference docRef = snapshot.docs.first.reference;
      await docRef.update(updatedTicket.toMap());
    
    } else {
      throw Exception('No ticket found with the provided ticketId');
    }
  } catch (e) {
    throw Exception('Error updating ticket: $e');
  }
}
  
   Future<void> deleteTicketyId(String ticketId) async {
  try {
   
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .where('ticketId', isEqualTo: ticketId)
        .get();
   
    if (snapshot.docs.isNotEmpty) {
      DocumentReference docRef = snapshot.docs.first.reference;
      await docRef.delete();
    } else {
      throw Exception('No ticket found with the provided ticketId');
    }
  } catch (e) {
    throw Exception('Error deleting ticket: $e');
  }
}
