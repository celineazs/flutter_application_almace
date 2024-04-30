import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/Usuario.dart';

class Controlador_RegistrarUsuario {

  final CollectionReference _usuariosCollection =
      FirebaseFirestore.instance.collection('Usuarios');

  Future<bool> registrarUsuario(Usuario usuario) async {
    final querySnapshot = await _usuariosCollection
        .where('nombre', isEqualTo: usuario.nombre)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return false;
    }

    await _usuariosCollection.add(usuario.toMap());
    return true;
  }

}