class Operador {
  String IdChofer;
  String nombre;
  String licenciaConducir;
  String contacto;
  String estado;

  Operador({
    required this.IdChofer,
    required this.nombre,
    required this.licenciaConducir,
    required this.contacto,
    required this.estado,
  });
  Map<String, dynamic> toMap() {
    return {
      'IdChofer': IdChofer,
      'nombre': nombre,
      'licenciaConducir': licenciaConducir,
      'contacto': contacto,
      'estadoSalud': estado,
    };
  }
}


