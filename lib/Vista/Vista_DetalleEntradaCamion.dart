import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Modelo/AgendaReturn.dart';
import 'package:flutter_application_almacee/Vista/EntryChecklistScreen.dart';

class DetalleEntradaCamion extends StatelessWidget {
  final Agenda2 entrada;

  const DetalleEntradaCamion({super.key, required this.entrada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Folio: ${entrada.folio}'),
            Text('Camión: ${entrada.matriculaCamion}'),
            Text('Nombre del Conductor: ${entrada.nombreOperador}'),
            Text( 'Fecha: ${entrada.fecha}'),
            Text('Tipo de Carga: ${entrada.tipodeCarga}'),
            Text('Peso de Carga: ${entrada.pesoCarga}'),
            Text('Destino de Carga: ${entrada.destinoCarga}'),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EntryChecklistScreen(entrada: entrada),
                          ),
                        );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
