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
   appBar: AppBar(
      title: const Text(
        'Almacén',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
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
    body: SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Tipo')),
          DataColumn(label: Text('Nom. Producto')),
          DataColumn(label: Text('Cantidad')),
          DataColumn(label: Text('fecha')),
          DataColumn(label: Text('Usuario')),
          DataColumn(label: Text('encargado')),
        ],
        rows: reportes.map((objeto) {
          return DataRow(cells: [
            DataCell(Text(objeto.tipo)),
            DataCell(Text(objeto.nomproducto)),
            DataCell(Text(objeto.Cantidad.toString())),
            DataCell(Text(objeto.Fecha.toString())),
            DataCell(Text(objeto.Usuario)),
            DataCell(Text(objeto.Encargado)),
          ]);
        }).toList(),
      ),
    ),
  );
}
}