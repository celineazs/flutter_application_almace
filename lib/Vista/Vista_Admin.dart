import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Vista/Vista_GestionUsuarios.dart';
import 'package:flutter_application_almacee/Vista/Vista_MenuAlmacen.dart';
import 'package:flutter_application_almacee/Vista/Vista_MenuVigilante.dart';

class VistaAdmin extends StatefulWidget {
  @override
  State<VistaAdmin> createState() => _VistaAdminState();
}

class _VistaAdminState extends State<VistaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panel de Administración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Almacen"
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => const Inicio(),
                                ),
                              );
              },
              child: Text('Almacen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Vigilante"
                 Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => MenuVigilante(),
                              ),
                            );
               
              },
              child: Text('Vigilante'),
            ),
            ElevatedButton(
              onPressed: () {
                 // Acción para el botón "Gestionar Entradas"
                 
              },
              child: Text('Gestionar Agenda'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Gestionar Usuarios"
                Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) =>  VistaGestionUsuario(),
                                ),
                              );
              },
              child: Text('Gestionar Usuarios'),
            ),
          ],
        ),
      ),
    );
  }
}
