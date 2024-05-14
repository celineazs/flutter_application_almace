import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/HistorialOperador.dart';
import 'package:flutter_application_almacee/Modelo/InfraccionOperador.dart';

class ControladorHistorialOperador{
    
    final CollectionReference Infracciones =FirebaseFirestore.instance.collection('RegistroInFraccionesOperador');
  final CollectionReference Historial = FirebaseFirestore.instance.collection('HistorialOperador'); 

    Future<bool> agregarInfraccionOperador(InfraccionOperador infraccionOperador) async {
    try {
      await Infracciones.add(infraccionOperador.toMap());
      return true;
    } catch (e) {
      print('Error al agregar la infracción: $e');
      return false;
    }
    }
 
Future<List<InfraccionOperador>> getRegistroInFraccionesOperador(String idChofer) async {
  List<InfraccionOperador> registroInfracciones = [];
  final querySnapshot = await Infracciones
      .where('idChofer', isEqualTo: idChofer)
      .get();
  for (var doc in querySnapshot.docs) {
    registroInfracciones.add(InfraccionOperador(
      idChofer: doc['idChofer'],
      Infraccion: doc['Infraccion'],
      fecha: doc['fecha'],
      encargado: doc['encargado'],
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