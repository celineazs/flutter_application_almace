import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Vista/Vista_DetallesOperador.dart';
import 'package:flutter_application_almacee/Vista/Vista_FormuOperador.dart';
import '../Modelo/Operador.dart';

class VistaOperador extends StatelessWidget {
  
  final List<Operador> _operadores = [
    Operador(
      IdChofer: '1234-ABC',
      nombre: 'Juan Pérez',
      licenciaConducir: '123456789',
      contacto: '555-1234',
      experiencia: 5,
      historialViajes: ['Viaje 1', 'Viaje 2'],
      calificaciones: ['Buena', 'Regular'],
      estadoSalud: 'Bueno',
      documentosIdentificacion: ['DNI 1234567', 'Pasaporte ABC123'],
      certificadosCapacitacion: ['Certificado 1', 'Certificado 2'],
      registroInfracciones: ['Infracción 1', 'Infracción 2'],
    ),
    Operador(
      IdChofer: '5678-DEF',
      nombre: 'María Rodríguez',
      licenciaConducir: '987654321',
      contacto: '555-5678',
      experiencia: 8,
      historialViajes: ['Viaje 3', 'Viaje 4'],
      calificaciones: ['Buena', 'Muy buena'],
      estadoSalud: 'Excelente',
      documentosIdentificacion: ['DNI 7654321', 'Pasaporte DEF567'],
      certificadosCapacitacion: ['Certificado 3', 'Certificado 4'],
      registroInfracciones: ['Infracción 3', 'Infracción 4'],
    ),
  ];

   VistaOperador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Operadores', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 41, 39, 39), 
      elevation: 0, 
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        onPressed: () {
          Navigator.pop(context);
    },
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.add),
      color: Colors.white,
      onPressed: () {
       Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const VistaForrperador()),
                   );
    },
    ),
  ],
      toolbarHeight: 80, 
    ),
      body: ListView.separated(
        itemCount: _operadores.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_operadores[index].nombre),
            subtitle: Text(_operadores[index].IdChofer),
    tileColor: const Color.fromARGB(206, 243, 235, 235),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleOperador(operador: _operadores[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
