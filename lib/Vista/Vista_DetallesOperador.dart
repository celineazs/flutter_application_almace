import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_HistorialOperador.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Operador.dart';
import 'package:flutter_application_almacee/Modelo/HistorialOperador.dart';
import 'package:flutter_application_almacee/Modelo/InfraccionOperador.dart';
import '../Modelo/Operador.dart';
class DetalleOperador extends StatefulWidget {
  final Operador operador;

  const DetalleOperador({required this.operador, Key? key}) : super(key: key);

  @override
  State<DetalleOperador> createState() => _DetalleOperadorState();
}

class _DetalleOperadorState extends State<DetalleOperador> {
   late List<InfraccionOperador> registroInfracciones;
   late List<HistorialOperador> historialOperador;
    ControladorOperador controlador = ControladorOperador();
    ControladorHistorialOperador controladorHistorial = ControladorHistorialOperador();
     @override
   void initState() {
  super.initState();
  cargarHistorialOperador();
 
}
Future<List<dynamic>> cargarHistorialOperador() async {
  List<HistorialOperador> listaHistorialOperador = await controladorHistorial.getHistorialOperador(widget.operador.IdChofer);
  List<InfraccionOperador> listaInfracciones = await controladorHistorial.getRegistroInFraccionesOperador(widget.operador.IdChofer);
  return [listaHistorialOperador, listaInfracciones];
}


   @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Detalles de ${widget.operador.nombre}',
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
      backgroundColor: Colors.transparent,
    ),
    body: ListView(
      children: [
        ListTile(
          title: Text('ID del Operador: ${widget.operador.IdChofer}'),
        ),
        ListTile(
          title: Text('Nombre del Chofer: ${widget.operador.nombre}'),
        ),
        ListTile(
          title: Text('Licencia de Conducir: ${widget.operador.licenciaConducir}'),
        ),
        ListTile(
          title: Text('Contacto: ${widget.operador.contacto}'),
        ),
        ListTile(
          title: Text('Estado de Salud: ${widget.operador.estadoSalud}'),
        ),
        FutureBuilder<List<dynamic>>(
  future: cargarHistorialOperador(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      List<HistorialOperador> historialOperador = snapshot.data![0];
      List<InfraccionOperador> registroInfracciones = snapshot.data![1];
      return Column(
        children: [
          const ListTile(
            title: Text('Historial de Operador:'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: historialOperador.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Folio: ${historialOperador[index].folio} - Fecha: ${historialOperador[index].fecha} ${historialOperador[index].hora}'),
              );
            },
          ),
          const ListTile(
            title: Text('Registro de Infracciones:'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: registroInfracciones.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Infracción: ${registroInfracciones[index].Infraccion}'),
              );
            },
          ),
        ],
      );
    }
  },
),
      ],
    ),
  );
}
}

