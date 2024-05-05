import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Login.dart';
import 'package:flutter_application_almacee/Modelo/Usuario.dart';
import 'package:flutter_application_almacee/Vista/Vista_registrar.dart';

class VistaGestionUsuario extends StatefulWidget {
  const VistaGestionUsuario({super.key});

  @override
  State<VistaGestionUsuario> createState() => _VistaGestionUsuarioState();
}

class _VistaGestionUsuarioState extends State<VistaGestionUsuario> {
  List<Usuario> usuarios = [];
  final ControladorLogin controlador = ControladorLogin();
  @override
  void initState() {
  super.initState();
  _cargarUsuarios();
}

Future<void> _cargarUsuarios() async {
  List<Usuario> listaUsuarios = await controlador.getUsuariosFromFirebase();
  setState(() {
    usuarios = listaUsuarios;
  });
}

  @override
   Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 41, 39, 39), // Color negro
          elevation: 0, // Sin sombra debajo del AppBar
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color to white
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context); 
              },
      ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => const RegistroUsuarios(),
                              ),
                            );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Matrícula')),
                  DataColumn(label: Text('Tipo de Usuario')),
                  DataColumn(label: Text('Es Admin')),
                ],
                rows: usuarios
                    .map(
                      (usuario) => DataRow(cells: [
                        DataCell(Text(usuario.nombre)),
                        DataCell(Text(usuario.matricula)),
                        DataCell(Text(usuario.tipoUsuario)),
                        DataCell(Text(usuario.esAdmin.toString())),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
