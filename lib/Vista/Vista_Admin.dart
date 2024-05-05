import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Vista/Vista_GestionUsuarios.dart';
import 'package:flutter_application_almacee/Vista/Vista_MenuAlmacen.dart';
import 'package:flutter_application_almacee/Vista/Vista_MenuVigilante.dart';

class VistaAdmin extends StatefulWidget {
  const VistaAdmin({super.key});

  @override
  State<VistaAdmin> createState() => _VistaAdminState();
}

class _VistaAdminState extends State<VistaAdmin> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 15, 58, 47),
                Color.fromARGB(255, 52, 174, 190),
              ],
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 100,
                    right: 0,
                  ),
                  child: Text(
                    'Panel de Administración',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
              ),
            ),child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      // Acción para el botón "Almacen" 
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
        builder: (context) => const Inicio(),
      ),
    );
  },
  style: OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Ajusta el padding para hacer el botón más grande
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Ajusta el radio del borde
    ),
    side: const BorderSide(color: Colors.black), // Añade un borde alrededor del botón
  ),
  child: const Text('Almacen'),
),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón "Vigilante"
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuVigilante(),
                        ),
                      );
                    },
                    child: const Text('Vigilante'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón "Gestionar Entradas"
                    },
                    child: const Text('Gestionar Agenda'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón "Gestionar Usuarios"
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) =>  VistaGestionUsuario(),
                        ),
                      );
                    },
                    child: const Text('Gestionar Usuarios'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}