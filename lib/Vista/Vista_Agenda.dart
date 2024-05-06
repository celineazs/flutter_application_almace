import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Agenda.dart';
import 'package:flutter_application_almacee/Modelo/Agenda.dart';
import 'package:flutter_application_almacee/Vista/Vista_DetalleEntradaCamion.dart';
import 'package:flutter_application_almacee/Vista/Vista_DetallesSalidaCamiones.dart';
class VistaAgenda extends StatefulWidget {
  const VistaAgenda({super.key});


  @override
  State<VistaAgenda> createState() => _VistaAgendaState();
}

class _VistaAgendaState extends State<VistaAgenda> {
  ControladorAgenda controlador = ControladorAgenda();
  List<Agenda> entradasProgramadas = [];

   List<Agenda> salidasProgramadas = [];

@override
  void initState() {
  super.initState();
  _cargarAgenda();
}

Future<void> _cargarAgenda() async {
  List<Agenda> listaAgendaEntrada = await controlador.obtenerAgendasEntrada();
  List<Agenda> listaAgendaSalida = await controlador.obtenerAgendasSalida();
  setState(() {
    salidasProgramadas = listaAgendaSalida;
    entradasProgramadas = listaAgendaEntrada;
  });
}

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
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
                return Column(
                  children: [
                    ListTile(
                      title: Text('Camión: ${entradasProgramadas[index].matriculaCamion}'),
                      subtitle: Text('Hora de Entrada: ${entradasProgramadas[index].hora}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleEntradaCamion(entrada: entradasProgramadas[index]),
                          ),
                        );
                      },
                    ),
                   
                  ],
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
                return Column(
                  children: [
                    ListTile(
                      title: Text('Camión: ${salidasProgramadas[index].matriculaCamion}'),
                      subtitle: Text('Hora de Salida: ${salidasProgramadas[index].hora}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleSalidaCamion(salida: salidasProgramadas[index]),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}