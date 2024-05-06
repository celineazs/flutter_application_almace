import 'package:flutter/material.dart';

class HistorialSalida extends StatelessWidget {
  const HistorialSalida({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Consulta de productos',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
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
    body: Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajusta el margen
          height: MediaQuery.of(context).size.height * 0.08, // Ajusta la altura
         decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 39, 39),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // IconButton(
              //   icon: const Icon(Icons.file_upload_outlined, size: 40),
              //   color: Colors.white,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Altas()),
              //     );
              //   },
              // ),
              SizedBox(width: 20),
              // IconButton(
              //   icon: const Icon(Icons.file_download_outlined, size: 40),
              //   color: Colors.white,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Bajas()),
              //     );
              //   },
              // ),
              SizedBox(width: 20),
              // IconButton(
              //   icon: const Icon(Icons.edit_note_outlined, size: 40),
              //   color: Colors.white,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Actualizar()),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    ),
  );
}
}