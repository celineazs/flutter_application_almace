import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_ReporteVigilante.dart';
import 'package:flutter_application_almacee/Modelo/AgendaReturn.dart';
import 'package:flutter_application_almacee/Modelo/ObservacionVigilante.dart';
import 'package:flutter_application_almacee/Modelo/ReporteVigilante.dart';

class ExitChecklistScreen extends StatefulWidget {
  final Agenda2 salida;
  final String usuario;
  const ExitChecklistScreen({super.key, required this.salida, required this.usuario});

  
  @override
  _ExitChecklistScreenState createState() => _ExitChecklistScreenState();
}

class _ExitChecklistScreenState extends State<ExitChecklistScreen> {
  controlador_ReporteVigilante controlador = controlador_ReporteVigilante();
  String cadena = '';
  final observacionesController = TextEditingController();
  bool neumaticosRevisados = false;
  bool frenosRevisados = false;
  bool lucesRevisadas = false;
  bool fluidosRevisados = false;
  bool claxonRevisado = false;
  bool espejosRevisados = false;
  bool documentacionRevisada = false;
  bool combustibleVerificado = false;
  bool cargaVerificada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: const Text('SALIDA CHECKLIST'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Elementos:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Neumáticos revisados'),
                value: neumaticosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    neumaticosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Frenos revisados'),
                value: frenosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    frenosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Luces revisadas'),
                value: lucesRevisadas,
                onChanged: (bool? value) {
                  setState(() {
                    lucesRevisadas = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Fluidos revisados'),
                value: fluidosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    fluidosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Claxon revisado'),
                value: claxonRevisado,
                onChanged: (bool? value) {
                  setState(() {
                    claxonRevisado = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Espejos revisados'),
                value: espejosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    espejosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Documentación verificada'),
                value: documentacionRevisada,
                onChanged: (bool? value) {
                  setState(() {
                    documentacionRevisada = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Combustible verificado'),
                value: combustibleVerificado,
                onChanged: (bool? value) {
                  setState(() {
                    combustibleVerificado = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Carga verificada'),
                value: cargaVerificada,
                onChanged: (bool? value) {
                  setState(() {
                    cargaVerificada = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 8),
              const Text('Observaciones:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Observaciones',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Acción para guardar la salida
                  if (neumaticosRevisados &&
                      frenosRevisados &&
                      lucesRevisadas &&
                      fluidosRevisados &&
                      claxonRevisado &&
                      espejosRevisados &&
                      documentacionRevisada &&
                      combustibleVerificado &&
                      cargaVerificada) {
                    // Acción para guardar la entrada
                    if(await controlador.agregarReporteVigilante(
                      ReporteVigilante(
                        folio: widget.salida.folio,
                        matriculaCamion: widget.salida.matriculaCamion,
                        fecha: widget.salida.fecha,
                        hora: widget.salida.hora,
                        tipo: 'Salida',
                        VigilanteAsignado: widget.usuario,
                        Estado: 'Aceptado',
                        Motivo: 'Cumplimiento de checklist, todos los elementos revisados,revise el panel de observaciones para mas detalles',
                      ),
                    )){
                    await controlador.eliminarAgenda(widget.salida.folio,widget.salida.nombreOperador,true,'Salida');
                    await controlador.agregarObservacionVigilante(
                      ObservacionVigilante(
                        folio: widget.salida.folio,
                        observacion: observacionesController.text, // Add this line
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Entrada aceptada'),
                          content: const Text('La entrada ha sido aceptada.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                 Navigator.of(context).pop();
                                 Navigator.of(context).pop();
                                            
                              },
                              child: const Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );}
                  } else {
                    String checklistPendiente = 'CheckList pendiente\n';
                    if (!neumaticosRevisados) {
                      checklistPendiente += '-Neumáticos\n';
                    }
                    if (!frenosRevisados) {
                      checklistPendiente += '-Frenos\n';
                    }
                    if (!lucesRevisadas) {
                      checklistPendiente += '-Luces\n';
                    }
                    if (!fluidosRevisados) {
                      checklistPendiente += '-Fluidos\n';
                    }
                    if (!claxonRevisado) {
                      checklistPendiente += '-Claxon\n';
                    }
                    if (!espejosRevisados) {
                      checklistPendiente += '-Espejos\n';
                    }
                    if (!documentacionRevisada) {
                      checklistPendiente += '-Documentacion\n';
                    }
                    if (!combustibleVerificado) {
                      checklistPendiente += '-Combustible\n';
                    }
                    if (!cargaVerificada) {
                      checklistPendiente += '-Carga\n';
                    }
                    setState(() {
                      cadena = checklistPendiente;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordes rectangulares
                  ),
                ),
                child: const Text('Aceptar salida'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (neumaticosRevisados &&
                      frenosRevisados &&
                      lucesRevisadas &&
                      fluidosRevisados &&
                      claxonRevisado &&
                      espejosRevisados &&
                      documentacionRevisada &&
                      combustibleVerificado &&
                      cargaVerificada &&

                      documentacionRevisada) {
                    // Acción para guardar la entrada
                  } else {
                    String checklistPendiente = 'CheckList pendiente,revise el panel de observaciones para mas informacion\n';
                    checklistPendiente += 'no se completo el check list de:\n';
                    if (!neumaticosRevisados) {
                      checklistPendiente += '-Neumáticos\n';
                    }
                    if (!frenosRevisados) {
                      checklistPendiente += '-Frenos\n';
                    }
                    if (!lucesRevisadas) {
                      checklistPendiente += '-Luces\n';
                    }
                    if (!fluidosRevisados) {
                      checklistPendiente += '-Fluidos\n';
                    }
                    if (!claxonRevisado) {
                      checklistPendiente += '-Claxon\n';
                    }
                    if (!espejosRevisados) {
                      checklistPendiente += '-Espejos\n';
                    }
                    if (!documentacionRevisada) {
                      checklistPendiente += '-Documentacion\n';
                    }
                    if (!combustibleVerificado) {
                      checklistPendiente += '-Combustible \n';
                    }
                    if (!cargaVerificada) {
                      checklistPendiente += '-Carga \n';
                    }
                     if (await controlador.agregarReporteVigilante(
                      ReporteVigilante(
                        folio: widget.salida.folio,
                        matriculaCamion: widget.salida.matriculaCamion,
                        fecha: widget.salida.fecha,
                        hora: widget.salida.hora,
                        tipo: 'Salida',
                        VigilanteAsignado: widget.usuario,
                        Estado: 'Negado',
                        Motivo: 'Negación de Salida, no se completó el checklist\n$checklistPendiente',
                      ),
                    )){
                  await controlador.eliminarAgenda(widget.salida.folio,widget.salida.nombreOperador,false,'Salida');
                    await controlador.agregarObservacionVigilante(
                      ObservacionVigilante(
                        folio: widget.salida.folio,
                        observacion: observacionesController.text, 
                      ),
                    );}
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Salida rechazada'),
                          content: const Text('se ha rechazado la salida, revise el panel de observaciones para mas detalles.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                              },
                              child: const Text('cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordes rectangulares
                  ),
                ),
                child: const Text('Negar Salida'),
              ),
              if (cadena.isNotEmpty)
                Text(
                  'Elementos pendientes:\n$cadena',
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}