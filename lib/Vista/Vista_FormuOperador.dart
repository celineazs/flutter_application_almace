import 'package:flutter/material.dart';

class VistaForrperador extends StatelessWidget {
  const VistaForrperador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Operador', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 41, 39, 39),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
           toolbarHeight: 80,
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        onPressed: () {
          Navigator.pop(context);
    },
  )
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
              const TextField(
                decoration: InputDecoration(
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese la matrícula del camión',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Licencia:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Ingrese la licencia',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estado:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el contacto del chofer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              const SizedBox(height: 20),
              const Text(
                'Historial de Viajes:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Ingrese el historial de viajes del chofer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Documentación:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Ingrese la documentación del chofer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    },
                  style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
