import 'package:flutter/material.dart';

import '../Modelo/Entrada.dart';
import '../Modelo/Salida.dart';

class VistaAgenda extends StatelessWidget {
  final List<EntradaProgramada> entradasProgramadas = [
    EntradaProgramada(
      matriculaCamion: 'XXXX-XXX',
      horaEntrada: '08:00',
    ),
    EntradaProgramada(
      matriculaCamion: 'YYYY-YYY',
      horaEntrada: '09:30',
    ),
  ];

  final List<SalidaProgramada> salidasProgramadas = [
    SalidaProgramada(
      matriculaCamion: 'XXXX-XXX',
      horaSalida: '16:00',
    ),
    SalidaProgramada(
      matriculaCamion: 'YYYY-YYY',
      horaSalida: '18:00',
    ),
  ];

   VistaAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 41, 39, 39), 
        elevation: 0, 
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 80
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Entradas Programadas (${entradasProgramadas.length}):'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entradasProgramadas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Camión: ${entradasProgramadas[index].matriculaCamion}'),
                  subtitle: Text('Hora de Entrada: ${entradasProgramadas[index].horaEntrada}'),
                );
              },
            ),
          ),
          ListTile(
            title: Text('Salidas Programadas (${salidasProgramadas.length}):'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: salidasProgramadas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Camión: ${salidasProgramadas[index].matriculaCamion}'),
                  subtitle: Text('Hora de Salida: ${salidasProgramadas[index].horaSalida}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
