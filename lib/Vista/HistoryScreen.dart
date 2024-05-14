import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_ReporteVigilante.dart';
import 'package:flutter_application_almacee/Modelo/ReporteVigilante.dart';
import 'package:flutter_application_almacee/Vista/Vista_ObservacionesVigilante.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HistoryScreen extends StatefulWidget {
  
  const HistoryScreen({super.key, Key });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  controlador_ReporteVigilante controlador = controlador_ReporteVigilante();
  List<ReporteVigilante> historial=[];

  @override
  void initState() {
    super.initState();
    _cargarhistorial();
  }

  Future<void> _cargarhistorial() async {
    List<ReporteVigilante> lista = await controlador.obtenerReporteVigilanteSalida();
    setState(() {
    historial = lista;
    });
  }
  Future<void> generarPDF() async {
  final pdf = pw.Document();
  final ByteData data = await rootBundle.load('lib/assets/logo.png');
  final Uint8List bytes = data.buffer.asUint8List();
  final image = pw.MemoryImage(bytes);

  // Dividir los datos en lotes de tamaño adecuado para cada página
  const batchSize = 10; // Número de filas por página
  final batches = <List<ReporteVigilante>>[];
  for (var i = 0; i < historial.length; i += batchSize) {
    batches.add(historial.sublist(i, i + batchSize < historial.length ? i + batchSize : historial.length));
  }

  for (var batchIndex = 0; batchIndex < batches.length; batchIndex++) {
    final batch = batches[batchIndex];
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Image(image, width: 150, height: 300), // Ajustar el tamaño de la imagen
                  pw.SizedBox(width: 5), // Espacio entre la imagen y el texto
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Transportes',
                        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        'Reporte de Agenda',
                        style: const pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                border: pw.TableBorder.all(),
                headerAlignment: pw.Alignment.center,
                cellAlignment: pw.Alignment.center,
                headerDecoration: const pw.BoxDecoration(color: PdfColors.cyan),
                   data: [
        ['folio','Tipo', 'Camión', 'Fecha', 'Hora', 'Vigilante', 'Estado'],
       
        for (var historialItem in batch)
        [
          historialItem.folio,
          historialItem.tipo,
          historialItem.matriculaCamion,
          historialItem.fecha,
          historialItem.hora,
          historialItem.Vigilante,
          historialItem.Estado,
        ],
      ],
              ),
              pw.SizedBox(height: 20),
              // Este Row puede contener la información que quieras agregar en cada página
              pw.Row(
                children: [
                  pw.Text('Página ${batchIndex + 1} de ${batches.length}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/reportes.pdf");
  try {
    await file.writeAsBytes(await pdf.save());
    OpenFile.open(file.path);
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('PDF generado'),
          content: const Text('El PDF se ha generado correctamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('No se pudo generar el PDF.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.note, size: 30),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const vistaObservaciones()),
              );
            },
          ),
        ],
        centerTitle: true,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 15, 58, 47),
                Color.fromARGB(255, 52, 174, 190),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: historial.isEmpty ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: historial.length,
        itemBuilder: (context, index) {
          final entry = historial[index];
          Color tileColor = Colors.white; 
          if (entry.Estado == 'Aceptado') {
            tileColor = Colors.green;
          } else if (entry.Estado == 'Negado') {
            tileColor = Colors.red;
          }

          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Detalles del Reporte'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Folio: ${entry.folio}'),
                        Text('Estado: ${entry.Estado}'),
                        Text('Fecha: ${entry.fecha}'),
                        Text('Hora: ${entry.hora}'),
                        Text('Tipo: ${entry.tipo}'),
                        Text('Camión: ${entry.matriculaCamion}'),
                        Text('Vigilante: ${entry.Vigilante}'),
                        Text('Motivo: ${entry.Motivo}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  '${entry.Estado} - ${entry.fecha} a las ${entry.hora}',
                  style: const TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                ),
                tileColor: tileColor, // el color de fondo
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0), // espacio entre los elementos
                    Text('Folio: ${entry.folio}'),
                    Text('Tipo: ${entry.tipo}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() async {
         await generarPDF();
        
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.picture_as_pdf),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}