


class TicketAvion {

final String ticketId;
final String aerolinea;
final int  numvuelo;
final String pasajero;
final String origen;
final String destino;

  TicketAvion({
    required this.ticketId,
    required this.aerolinea,
    required this.numvuelo,
    required this.pasajero,
    required this.origen,
    required this.destino,
  });

  Map<String, dynamic> toMap() {
    return {
      'ticketId': ticketId,
      'aerolinea': aerolinea,
      'numvuelo': numvuelo,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
    };
  }

}