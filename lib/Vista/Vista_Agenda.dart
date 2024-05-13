import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Agenda.dart';
import 'package:flutter_application_almacee/Modelo/AgendaReturn.dart';
import 'package:flutter_application_almacee/Vista/Vista_DetalleEntradaCamion.dart';
import 'package:flutter_application_almacee/Vista/Vista_DetallesSalidaCamiones.dart';

class VistaAgenda extends StatefulWidget {
  final String usuario;
  const VistaAgenda({super.key, required this.usuario});


  @override
  State<VistaAgenda> createState() => _VistaAgendaState();
}

class _VistaAgendaState extends State<VistaAgenda> {
  ControladorAgenda controlador = ControladorAgenda();
  List<Agenda2> entradasProgramadas = [];

   List<Agenda2> salidasProgramadas = [];

@override
  void initState() {
  super.initState();
  _cargarAgenda();
}

Future<void> _cargarAgenda() async {
  List<Agenda2> listaAgendaEntrada = await controlador.obtenerAgendasEntrada();
  List<Agenda2> listaAgendaSalida = await controlador.obtenerAgendasSalida();
  setState(() {
    salidasProgramadas = listaAgendaSalida;
    entradasProgramadas = listaAgendaEntrada;
  });
}

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      toolbarHeight: 80,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 58, 47),
              Color.fromARGB(255, 52, 174, 190),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
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
                      subtitle: Text('Hora de Entrada: ${entradasProgramadas[index].hora} del dia: ${entradasProgramadas[index].fecha}'),
                      onTap: () {
                        print('Entrada: ${entradasProgramadas[index].folio}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            
                            builder: (context) => DetalleEntradaCamion(entrada: entradasProgramadas[index],usuario: widget.usuario),
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
                      subtitle: Text('Hora de Salida: ${salidasProgramadas[index].hora} del dia: ${salidasProgramadas[index].fecha}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleSalidaCamion(salida: salidasProgramadas[index],usuario: widget.usuario),
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
