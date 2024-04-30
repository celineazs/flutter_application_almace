import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/Usuario.dart';

class ControladorLogin {
  final CollectionReference _usuariosCollection =
      FirebaseFirestore.instance.collection('Usuarios');

  Future<List<Usuario>> getUsuariosFromFirebase() async {
    List<Usuario> usuarios = [];
    final querySnapshot = await _usuariosCollection.get();
    for (var doc in querySnapshot.docs) {
      usuarios.add(Usuario(
        nombre: doc['nombre'],
        contrasena: doc['contrasena'],
        matricula: doc['matricula'],
        tipoUsuario: doc['tipoUsuario'],
        esAdmin: doc['esAdmin'],
      ));
    }
    return usuarios;
  }

  Future<bool> login(String email, String password) async {
    List<Usuario> usuarios = await getUsuariosFromFirebase();
    for (var usuario in usuarios) {
      if (usuario.nombre == email && usuario.contrasena == password) {
        return true;
      }
    }
    return false;
  }

  Future<bool> isAdmin(String email) async {
    List<Usuario> usuarios = await getUsuariosFromFirebase();
    for (var usuario in usuarios) {
      if (usuario.nombre == email && usuario.esAdmin) {
        return true;
      }
    }
    return false;
  }

  Future<int> getTipoUsuario(String email) async {
    List<Usuario> usuarios = await getUsuariosFromFirebase();
    for (var usuario in usuarios) {
      if (usuario.nombre == email) {
        print(usuario.tipoUsuario);
        if (usuario.tipoUsuario == 'Almacenista') {
          return 1;
        } else if (usuario.tipoUsuario == 'Vigilante') {
          return 2;
        }
      }
    }
    return 0; // No se encontró el usuario
  }
}