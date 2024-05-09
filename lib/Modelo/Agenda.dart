
import 'package:cloud_firestore/cloud_firestore.dart';

class Agenda {
  String folio;
  String matriculaCamion;
  String nombreOperador;
  DateTime fecha;
  String tipo; //entrada o salida
  String tipodeCarga;
  String pesoCarga;
  String destinoCarga;
  

    Agenda({
    required this.folio,
    required this.matriculaCamion,
    required this.nombreOperador,
    required this.fecha,
    required this.tipo,
    required this.tipodeCarga,
    required this.pesoCarga,
    required this.destinoCarga,
  });

  Map<String, dynamic> toMap() {
  return {
    'folio': folio,
    'matriculaCamion': matriculaCamion,
    'nombreOperador': nombreOperador,
    'fecha': fecha,
    'tipo': tipo,
    'tipodeCarga': tipodeCarga,
    'pesoCarga': pesoCarga,
    'destinoCarga': destinoCarga,
  };
}
  factory Agenda.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  return Agenda(
    folio: data['folio'],
    matriculaCamion: data['matriculaCamion'],
    nombreOperador: data['nombreOperador'],
    fecha: (data['fecha'] as Timestamp).toDate(), // Convertir Timestamp a DateTime
    tipo: data['tipo'],
    tipodeCarga: data['tipodeCarga'],
    pesoCarga: data['pesoCarga'],
    destinoCarga: data['destinoCarga'],
  );
}



}


