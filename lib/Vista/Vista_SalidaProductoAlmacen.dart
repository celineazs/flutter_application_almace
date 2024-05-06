import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Almacen.dart';

class Bajas extends StatefulWidget {
  const Bajas({Key? key}) : super(key: key);

  @override
  State<Bajas> createState() => _BajasState();
}

class _BajasState extends State<Bajas> {
  ControladorAlmacen controlador = ControladorAlmacen();

  final folioController = TextEditingController();
  final cantidadController = TextEditingController();
  final usuarioController = TextEditingController();

  @override
  void dispose() {
    folioController.dispose();
    cantidadController.dispose();
    usuarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bajas', style: TextStyle(color: Colors.white),),
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
                  labelText: 'Folio',
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
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Usuario Despachado",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: 'Usuario Despachado',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final folio = folioController.text;
                  final cantidad = int.parse(cantidadController.text);
                  final usuario = usuarioController.text;
                  if(await controlador.eliminarProducto(folio, cantidad, usuario)){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto eliminado correctamente'),
                      ),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al eliminar el producto'),
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