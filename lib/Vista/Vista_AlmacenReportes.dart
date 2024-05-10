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
        title: const Text('Reportes', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: reportes.map((objeto) {
          return GestureDetector(
            onTap: () {
              showDialog(
  context: context,
  builder: (BuildContext context) {
    return Theme(
      data: ThemeData(
        // Cambia el color de fondo del diálogo aquí
        colorScheme: Theme.of(context).colorScheme.copyWith(
            background: Colors.grey,
        ),),
        child: Container(
      child: AlertDialog(
        title: const Text('Especificaciones', style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo: ${objeto.tipo}', style: const TextStyle(color: Colors.black, fontSize: 20)),
            Text('Nom. Producto: ${objeto.nomproducto}', style: const TextStyle(color: Colors.black, fontSize: 20)),
            Text('Cantidad: ${objeto.Cantidad}', style: const TextStyle(color: Colors.black, fontSize: 20)),
            Text('Fecha: ${objeto.Fecha}', style: const TextStyle(color: Colors.black, fontSize: 20)),
            Text('Usuario: ${objeto.Usuario}', style: const TextStyle(color: Colors.black, fontSize: 20)),
            Text('Encargado: ${objeto.Encargado}', style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar', style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
        ],
      ),
    ),
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