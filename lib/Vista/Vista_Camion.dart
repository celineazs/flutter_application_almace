import 'package:flutter_application_almacee/Vista/Vista_altasCamiones.dart';

import '../Modelo/Camion.dart';
import 'Vista_DetallesCamion.dart';
import 'package:flutter/material.dart';


class VistaCamion extends StatelessWidget {
  final List<Camion> _camiones = [
    Camion(
      matricula: 'XXX-XXX',
      modelo: 'Modelo 1',
      anoFabricacion: 2020,
      companiaTransporte: 'Compañía 1',
      enTransito: true,
      enEspera: false,
      enMantenimiento: false,
      kilometraje: 10000,
      ultimoServicio: '2023-01-01', 
      proximoServicio: '2024-01-01', 
      historialCargas: 2, 
    ),
    Camion(
      matricula: 'YYY-YYY',
      modelo: 'Modelo 2',
      anoFabricacion: 2019,
      companiaTransporte: 'Compañía 2',
      enTransito: false,
      enEspera: true,
      enMantenimiento: false,
      kilometraje: 20000,
      ultimoServicio: '2022-01-01',
      proximoServicio: '2023-01-01', 
      historialCargas: 2, 

    ),
  ];

   VistaCamion({super.key});
   
  @override
  Widget build(BuildContext context) {
  return Theme(
  data: Theme.of(context).copyWith(
  appBarTheme: const AppBarTheme(
  backgroundColor: Color.fromARGB(255, 41, 39, 39), 
  elevation: 0, 
  iconTheme: IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 80
  ),
  ),
  child: Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios_new_sharp),
    onPressed: () {
    Navigator.pop(context);
    },
  ),
  actions: [
    IconButton(
      
    icon: const Icon(Icons.add),
    color: Colors.white,
    onPressed: () {
       Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const AltaCamionView()),
                    );
    },
    ),
  ],
  ),
  body: ListView.separated(
  itemCount: _camiones.length,
  separatorBuilder: (BuildContext context, int index) => const Divider(),
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
    title: Text('Matrícula: ${_camiones[index].matricula}'),
    subtitle: Text('Estado: ${_getEstado(_camiones[index])}', style: const TextStyle(color: Color.fromARGB(255, 7, 68, 9))),
    tileColor: const Color.fromARGB(206, 243, 235, 235),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VistaDetallesCamion(camion: _camiones[index]),
    ),
    );
    },
    );
  },
  ),
  ),
  );
}

String _getEstado(Camion camion) {
  if (camion.enTransito) {
    return 'En tránsito';
  } else if (camion.enEspera) {
    return 'En espera';
  } else if (camion.enMantenimiento) {
    return 'En mantenimiento';
  } else {
    return 'Desconocido';
  }
}
}