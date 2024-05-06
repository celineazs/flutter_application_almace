import 'package:flutter/material.dart';

class Facturas extends StatelessWidget {
  const Facturas({super.key});

  
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Facturas',
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
    body: Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            // child: DataTable(
            //   columns: const [
            //     DataColumn(label: Text('Folio')),
            //     DataColumn(label: Text('Nombre')),
            //     DataColumn(label: Text('Cantidad')),
            //     DataColumn(label: Text('Marca')),
            //     DataColumn(label: Text('Medición')),
            //     DataColumn(label: Text('Proveedor')),
            //   ],
            //   rows: objetosAlmacen.map((objeto) {
            //     return DataRow(cells: [
            //       DataCell(Text(objeto.folio)),
            //       DataCell(Text(objeto.nombre)),
            //       DataCell(Text(objeto.cantidad.toString())),
            //       DataCell(Text(objeto.marca)),
            //       DataCell(Text(objeto.medicion)),
            //       DataCell(Text(objeto.proveedor)),
            //     ]);
            //   }).toList(),
            // ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajusta el margen
          height: MediaQuery.of(context).size.height * 0.08, // Ajusta la altura
         decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 39, 39),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.upload_file_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.verified, size: 40),
                color: Colors.white,
                onPressed: () {
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.edit_note_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}