import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Almacen.dart';
import 'package:flutter_application_almacee/Modelo/ReporteAlmacen.dart';

class VistaReportes extends StatefulWidget {
  const VistaReportes({super.key});

  @override
  State<VistaReportes> createState() => _VistaReportesState();
}

class _VistaReportesState extends State<VistaReportes> {
  List<ReporteAlmacen> reportes = [];
  ControladorAlmacen controlador = ControladorAlmacen();
   @override
  void initState() {
  super.initState();
  cargarReportes();
}

Future<void> cargarReportes() async {
  List<ReporteAlmacen> listaCamiones = await controlador.obtenerReportes();
  setState(() {
    reportes = listaCamiones;
  });
}


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Reportes', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined, size: 30),
            color: Colors.white,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AltaCamionView()),
              // );
            },
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: reportes.map((objeto) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Especificaciones'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipo: ${objeto.tipo}'),
                        Text('Nom. Producto: ${objeto.nomproducto}'),
                        Text('Cantidad: ${objeto.Cantidad}'),
                        Text('Fecha: ${objeto.Fecha}'),
                        Text('Usuario: ${objeto.Usuario}'),
                        Text('Encargado: ${objeto.Encargado}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 150.0,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo: ${objeto.tipo}'),
                  Text('Fecha: ${objeto.Fecha}'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}