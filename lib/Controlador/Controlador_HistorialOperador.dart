import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/HistorialOperador.dart';
import 'package:flutter_application_almacee/Modelo/InfraccionOperador.dart';

class ControladorHistorialOperador{
    
    final CollectionReference Infracciones =FirebaseFirestore.instance.collection('RegistroInFraccionesOperador');
  final CollectionReference Historial = FirebaseFirestore.instance.collection('HistorialOperador');   
 
Future<List<InfraccionOperador>> getRegistroInFraccionesOperador(String idChofer) async {
  List<InfraccionOperador> registroInfracciones = [];
  final querySnapshot = await Infracciones
      .where('idChofer', isEqualTo: idChofer)
      .get();
  for (var doc in querySnapshot.docs) {
    registroInfracciones.add(InfraccionOperador(
      idChofer: doc['idChofer'],
      Infraccion: doc['Infraccion'],
    ));
  }
  return registroInfracciones;
}

Future<List<HistorialOperador>> getHistorialOperador(String idChofer) async {
  List<HistorialOperador> historialOperador = [];
  final querySnapshot = await Historial
      .where('idChofer', isEqualTo: idChofer)
      .get();
  for (var doc in querySnapshot.docs) {
    historialOperador.add(HistorialOperador(
      idChofer: doc['idChofer'],
      folio: doc['folio'],
      matriculaCamion: doc['matriculaCamion'],
      fecha: doc['fecha'],
      hora: doc['hora'],
      tipo: doc['tipo'],
    ));
  }
  return historialOperador;
}
}