import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Almacen.dart';
import 'package:flutter_application_almacee/Modelo/Almacenobjeto.dart';


class Altas extends StatefulWidget {
  const Altas({Key? key}) : super(key: key);

  @override
  State<Altas> createState() => _AltasState();
}

class _AltasState extends State<Altas> {
  ControladorAlmacen controlador = ControladorAlmacen();

  final folioController = TextEditingController();
  final nombreController = TextEditingController();
  final cantidadController = TextEditingController();
  final marcaController = TextEditingController();
  final medicionController = TextEditingController();
  final proveedorController = TextEditingController();

  @override
  void dispose() {
    folioController.dispose();
    nombreController.dispose();
    cantidadController.dispose();
    marcaController.dispose();
    medicionController.dispose();
    proveedorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Producto', style: TextStyle(color: Colors.white),),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Folio",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: folioController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese folio',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Nombre",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Cantidad",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: cantidadController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Marca",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: marcaController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la marca',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Medición",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: medicionController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la medida',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Proveedor",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: proveedorController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el proveedor',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Almacenobjeto producto = Almacenobjeto(
                    folio: folioController.text,
                    nombre: nombreController.text,
                    cantidad: int.parse(cantidadController.text),
                    marca: marcaController.text,
                    medicion: medicionController.text,
                    proveedor: proveedorController.text,
                  );

                  if (await controlador.agregarProducto(producto)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto agregado correctamente'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al agregar el producto'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                
                ),
                child: const Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}