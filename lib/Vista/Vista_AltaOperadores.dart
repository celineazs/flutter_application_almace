import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Operador.dart';
import 'package:flutter_application_almacee/Modelo/Operador.dart';

class VistaAltasOperadores extends StatefulWidget {
  const VistaAltasOperadores({Key? key}) : super(key: key);

  @override
  _VistaAltasOperadoresState createState() => _VistaAltasOperadoresState();
}

class _VistaAltasOperadoresState extends State<VistaAltasOperadores> {
  final TextEditingController _idChoferController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _contactoController = TextEditingController();
  final TextEditingController _estadoSaludController = TextEditingController();
  final TextEditingController _licenciaController = TextEditingController();
  final ControladorOperador controlador = ControladorOperador();

  @override
  void clear() {
    _idChoferController.clear();
    _nombreController.clear();
    _licenciaController.clear();
    _contactoController.clear();
    _estadoSaludController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alta de Operador',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 253, 253),
            fontSize: 25,
          ),
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Nombre del Operador:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nombreController, // Asignar el controlador al campo de texto
                decoration: const InputDecoration(
                  hintText: 'Ingrese el nombre del operador',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Matrícula del Camión:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _idChoferController, // Asignar el controlador al campo de texto
                decoration: const InputDecoration(
                  hintText: 'Ingrese la matrícula del camión',
                  border: OutlineInputBorder(),
                ),
              ),
                const SizedBox(height: 20),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                      'Licencia:',
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _licenciaController, // Asignar el controlador al campo de texto
                      decoration: const InputDecoration(
                      hintText: 'Ingrese licencia',
                      border: OutlineInputBorder(),
                      ),
                    ),
                    ],
                  ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                      'Estado:',
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _estadoSaludController, // esto tu quitassss
                      decoration: const InputDecoration(
                      hintText: 'Ingrese el estado de la licencia',
                      border: OutlineInputBorder(),
                      ),
                    ),
                    ],
                  ),
                  ),
                ],
                ),
              const SizedBox(height: 20),
              const Text(
                'Contacto:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _contactoController, // Asignar el controlador al campo de texto
                decoration: const InputDecoration(
                  hintText: 'Ingrese el contacto del chofer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Botón "ACEPTAR"
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Verificar si se cumple la condición
                    if (await controlador.registrarOperador(Operador(
                      IdChofer: _idChoferController.text,
                      nombre: _nombreController.text,
                      licenciaConducir: _licenciaController.text,
                      contacto: _contactoController.text,
                      estadoSalud: _estadoSaludController.text,
                    ))) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('EXITO!'),
                            content: const Text('El operador ha sido registrado correctamente!'),
                            actions: [
                              TextButton(
                                child: const Text('Aceptar'),
                                onPressed: () {
                                  clear();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  ),
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


