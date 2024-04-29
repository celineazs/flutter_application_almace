import 'package:flutter/material.dart';

class Reportes extends StatefulWidget {
  const Reportes({super.key});

 @override
 _ReportesState createState() => _ReportesState();
}

class _ReportesState extends State<Reportes> {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Folio')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Fecha')),
            DataColumn(label: Text('Usuario')),
            DataColumn(label: Text('Encargado')),
          ],
          rows: List<DataRow>.generate(
            10, // Número de filas en la tabla
            (index) => DataRow(
              cells: <DataCell>[
                const DataCell(Text('Folio ')),
                const DataCell(Text('Cantidad')),
                const DataCell(Text('Fecha ')),
                DataCell(Text('Usuario $index')),
                DataCell(Text('Encargado $index')),
              ],
            ),
          ),
        ),
      ),
    );
 }
}