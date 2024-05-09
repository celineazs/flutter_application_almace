import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Almacen.dart';
import '../Modelo/Almacenobjeto.dart'; 
import 'Vista_EntradaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_SalidaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_ActualizarProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto

class Almacen extends StatefulWidget {
  const Almacen({super.key});

 @override
 _AlmacenState createState() => _AlmacenState();
}

class _AlmacenState extends State<Almacen> {
   List<Almacenobjeto> objetosAlmacen = [];
  ControladorAlmacen controlador = ControladorAlmacen();

  @override
  void initState() {
  super.initState();
  cargarProductos();
}

Future<void> cargarProductos() async {
  List<Almacenobjeto> listaCamiones = await controlador.getProductosBD();
  setState(() {
    objetosAlmacen = listaCamiones;
  });
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almacén', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
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
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Folio')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Marca')),
            DataColumn(label: Text('Medición')),
            DataColumn(label: Text('Proveedor')),
          ],
          rows: objetosAlmacen.map((objeto) {
            return DataRow(cells: [
              DataCell(Text(objeto.folio)),
              DataCell(Text(objeto.nombre)),
              DataCell(Text(objeto.cantidad.toString())),
              DataCell(Text(objeto.marca)),
              DataCell(Text(objeto.medicion)),
              DataCell(Text(objeto.proveedor)),
            ]);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 39, 39),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.file_upload_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Altas()),
                  );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.file_download_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bajas()),
                  );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.edit_note_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Actualizar()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}