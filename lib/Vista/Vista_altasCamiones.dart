import 'package:flutter/material.dart';

class AltaCamionView extends StatefulWidget {
  const AltaCamionView({super.key});

  @override
  _AltaCamionViewState createState() => _AltaCamionViewState();
}

class _AltaCamionViewState extends State<AltaCamionView> {
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _companiaController = TextEditingController();
  final TextEditingController _kilometrajeController = TextEditingController();
  DateTime _ultimoServicio = DateTime.now();
  DateTime _proximoServicio = DateTime.now();
  final List<String> _historialCargas = [];

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Text('Alta de Camión', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 41, 39, 39),
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
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Matrícula:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              ), 
            const SizedBox(height: 10),
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(labelText: 'Ingrese matrícula del camión',
              border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 20),
            const Text(
              'Modelo:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              ), 
            const SizedBox(height: 10),
            TextField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Ingrese modelo del camión'
              ,border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 20),
              Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Año de Fabricación:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _anoController,
                        decoration: const InputDecoration(
                          labelText: 'Ingrese el año de fabricación',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20), // Espaciador entre los campos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kilometraje:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _kilometrajeController,
                        decoration: const InputDecoration(
                          labelText: 'Ingrese el Kilometraje',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Compañía de Transporte:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              ), 
            const SizedBox(height: 10),
            TextField(
              controller: _companiaController,
              decoration: const InputDecoration(labelText: 'Ingrese Compañía de Transporte'
              ,border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 20.0),
            Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Último Servicio: ${_formatDate(_ultimoServicio)}', 
      textAlign: TextAlign.left, 
    ),
    const SizedBox(height: 10),
    Row(
      mainAxisAlignment: MainAxisAlignment.start, 
      children: [
        ElevatedButton(
          onPressed: () {
            _selectDate(context, _ultimoServicio).then((value) {
              if (value != null) {
                setState(() {
                  _ultimoServicio = value;
                });
              }
            });
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
          child: const Text('Seleccionar Último Servicio'),
        ), 
      ],
    ),
  ],
),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Próximo Servicio: ${_formatDate(_proximoServicio)}', 
                  textAlign: TextAlign.left,),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
              ElevatedButton(
              onPressed: () {
                _selectDate(context, _proximoServicio).then((value) {
                  if (value != null) {
                    setState(() {
                      _proximoServicio = value;
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
              child: const Text('Seleccionar Próximo Servicio'),
               ), 
              ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
            child: ElevatedButton(
              onPressed: _guardarCamion,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                ),
              child: const Text('Guardar Camión'),
             ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initialDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _guardarCamion() {
    // Aquí puedes utilizar los valores de los controladores y las variables
    // para crear una instancia de la clase Camion o realizar cualquier otra lógica de guardado.
    // Por ejemplo:
    // Camion camion = Camion(
    //   matricula: _matriculaController.text,
    //   modelo: _modeloController.text,
    //   anoFabricacion: int.parse(_anoController.text),
    //   companiaTransporte: _companiaController.text,
    //   kilometraje: int.parse(_kilometrajeController.text),
    //   ultimoServicio: _ultimoServicio,
    //   proximoServicio: _proximoServicio,
    //   historialCargas: _historialCargas,
    // );

    // Aquí puedes enviar la instancia de camion a donde necesites, por ejemplo, a una función que maneje el guardado en la base de datos.
  }
}