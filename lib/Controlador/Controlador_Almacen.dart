import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_almacee/Modelo/Almacenobjeto.dart';
import 'package:flutter_application_almacee/Modelo/ReporteAlmacen.dart';
import 'package:intl/intl.dart';


class ControladorAlmacen {
   final CollectionReference _almacenCollection =
      FirebaseFirestore.instance.collection('Almacen');
      final CollectionReference _reportesCollection = 
      FirebaseFirestore.instance.collection('ReportesAlmacen');


  Future<void> agregarRegistro(ReporteAlmacen registro) async {
    try {
      await _reportesCollection.add(registro.toMap());
    } catch (e) {
      print('Error al agregar el registro: $e');
    }
  }

  Future<bool> agregarProducto(Almacenobjeto producto) async {
  try {
    DocumentSnapshot doc = await _almacenCollection.doc(producto.folio).get();
    if (doc.exists) {
      int cantidadExistente = (doc.data() as Map<String, dynamic>)['cantidad'] ?? 0;
      await _almacenCollection.doc(producto.folio).update({
        'cantidad': cantidadExistente + producto.cantidad,
      });
      // Crear un registro de entrada/salida
      String formattedDate = DateFormat('dd/MM/yy HH:mm:ss').format(DateTime.now());
      ReporteAlmacen registro = ReporteAlmacen(
        tipo: 'Entrada',
        nomproducto: producto.nombre,
        Cantidad: producto.cantidad.toString(),
        Fecha: formattedDate,
        Usuario: '-------------', // Aquí debes colocar el nombre del usuario actual
        Encargado: 'nombre_encargado', // Aquí debes colocar el nombre del encargado
      );
      await agregarRegistro(registro);
      return true;
    } else {
      await _almacenCollection.doc(producto.folio).set(producto.toMap());

      // Crear un registro de entrada/salida
      String formattedDate = DateFormat('dd/MM/yy HH:mm:ss').format(DateTime.now());
      ReporteAlmacen registro = ReporteAlmacen(
        tipo: 'Entrada',
        nomproducto: producto.nombre,
        Cantidad: producto.cantidad.toString(),
        Fecha: formattedDate,
        Usuario: '-------------', // Aquí debes colocar el nombre del usuario actual
        Encargado: 'nombre_encargado', // Aquí debes colocar el nombre del encargado
      );
      await agregarRegistro(registro);
      return true;
    }
  } catch (e) {
    print('Error al agregar el producto: $e');
    return false;
  }
}

Future<bool> eliminarProducto(String folio, int cantidad, String usuario) async {
  try {
    DocumentSnapshot doc = await _almacenCollection.doc(folio).get();
    if (doc.exists) {
      int cantidadExistente = (doc.data() as Map<String, dynamic>)['cantidad'] ?? 0;
      if (cantidadExistente <= cantidad) {
        await _almacenCollection.doc(folio).delete();
      } else {
        await _almacenCollection.doc(folio).update({
          'cantidad': cantidadExistente - cantidad,
        });
      }
      // Crear un registro de entrada/salida
      String formattedDate = DateFormat('dd/MM/yy HH:mm:ss').format(DateTime.now());
      ReporteAlmacen registro = ReporteAlmacen(
        tipo: 'Salida',
        nomproducto: (doc.data() as Map<String, dynamic>)['nombre'] ?? '',
        Cantidad: cantidad.toString(),
        Fecha: formattedDate,
        Usuario: usuario, // Aquí debes colocar el nombre del usuario actual
        Encargado: 'nombre_encargado', // Aquí debes colocar el nombre del encargado
      );
      await agregarRegistro(registro);
      return true;
    }
  } catch (e) {
    print('Error al eliminar el producto: $e');
  }
  return false;
}


  Future<List<Almacenobjeto>> getProductosBD() async {
    try {
      QuerySnapshot querySnapshot = await _almacenCollection.get();
      return querySnapshot.docs
          .map((doc) => Almacenobjeto.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error al obtener los productos: $e');
      return [];
    }
  }
 Future<List<ReporteAlmacen>> obtenerReportes() async {
    try {
      QuerySnapshot querySnapshot = await _reportesCollection.get();
      return querySnapshot.docs.map((doc) => ReporteAlmacen.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error al obtener los reportes: $e');
      return [];
    }
  }

}