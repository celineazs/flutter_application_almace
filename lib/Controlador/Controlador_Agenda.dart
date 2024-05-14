import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/Agenda.dart';
import 'package:flutter_application_almacee/Modelo/AgendaReturn.dart';

class ControladorAgenda {

 final CollectionReference Agendas =FirebaseFirestore.instance.collection('Agendas');
final CollectionReference _camionesCollection = FirebaseFirestore.instance.collection('Camiones');
  Future<bool> agregarAgenda(Agenda agenda) async {
  try {
    // Busca el camión por su matrícula
    final camionQuery = await _camionesCollection
        .where('matricula', isEqualTo: agenda.matriculaCamion)
        .limit(1)
        .get();

    if (camionQuery.docs.isNotEmpty) {
      // Obtiene el documento del camión encontrado
      final camionDoc = camionQuery.docs.first;
      final camionData = camionDoc.data() as Map<String, dynamic>;

      // Obtiene la fecha del próximo servicio actual del camión
      final DateTime proximoServicioActual = camionData['proximoServicio'].toDate();

      // Compara las fechas para determinar cuál es más próxima
      final DateTime fechaProxima = (proximoServicioActual.isAfter(agenda.fecha))
          ? proximoServicioActual
          : agenda.fecha;

      // Actualiza el próximo servicio del camión con la fecha más próxima
      await camionDoc.reference.update({
        'proximoServicio': fechaProxima,
      });
    }

    // Agrega la agenda a la colección de agendas
    await Agendas.add(agenda.toMap());
    return true;
  } catch (e) {
    return false;
  }
}

  Future<List<Agenda2>> obtenerAgendasEntrada() async {
    try {
      QuerySnapshot querySnapshot = await Agendas
          .where('tipo', isEqualTo: 'Entrada')
          .orderBy('fecha', descending: false)
          .get();
      return querySnapshot.docs.map((doc) => Agenda2.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener las agendas de entrada: $e');
      return [];
    }
  }

  Future<List<Agenda2>> obtenerAgendasSalida() async {
    try {
      QuerySnapshot querySnapshot = await Agendas
          .where('tipo', isEqualTo: 'Salida')
          .orderBy('fecha', descending: false)
          .get();

      return querySnapshot.docs.map((doc) => Agenda2.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener las agendas de salida: $e');
      return [];
    }
  }




}