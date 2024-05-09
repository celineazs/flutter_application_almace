import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AltaFactura extends StatefulWidget {
  const AltaFactura({super.key});

  @override
  _AltaFacturaState createState() => _AltaFacturaState();
}

class _AltaFacturaState extends State<AltaFactura> {
  final CollectionReference _camionesCollection =
      FirebaseFirestore.instance.collection('Facturas');

  File? _pdfFile;

  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
      });

      try {
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('facturas/${DateTime.now().millisecondsSinceEpoch}.pdf');

        UploadTask uploadTask = ref.putFile(_pdfFile!);
        await uploadTask.whenComplete(() => null);

        String pdfUrl = await ref.getDownloadURL();

        await _camionesCollection.add({'pdfUrl': pdfUrl});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF subido con éxito')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir el PDF: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Facturas', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _uploadFile,
              child: const Text('Seleccionar PDF'),
            ),
            if (_pdfFile != null) Text('PDF seleccionado: ${_pdfFile!.path}'),
          ],
        ),
      ),
    );
  }
}
