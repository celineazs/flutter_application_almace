import 'package:cloud_firestore/cloud_firestore.dart';

class ReporteVigilante {
  String folio;
  String matriculaCamion;
  String fecha;
  String hora;
  String tipo; //entrada o salida
  String Vigilante;
  String Estado;
  String Motivo;

  ReporteVigilante({
    required this.folio,
    required this.matriculaCamion,
    required this.fecha,
    required this.hora,
    required this.tipo,
    required this.Vigilante,
    required this.Estado,
    required this.Motivo,
  });

  Map<String, dynamic> toMap() {
    return {
      'folio': folio,
      'matriculaCamion': matriculaCamion,
      'fecha': fecha,
      'hora': hora,
      'tipo': tipo,
      'Vigilante': Vigilante,
      'Estado': Estado,
      'Motivo': Motivo,
    };
  }

  factory ReporteVigilante.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ReporteVigilante(
      folio: data['folio'],
      matriculaCamion: data['matriculaCamion'],
      fecha: data['fecha'],
      hora: data['hora'],
      tipo: data['tipo'],
      Vigilante: data['Vigilante'],
      Estado: data['Estado'],
      Motivo: data['Motivo'],
    );
  }
}