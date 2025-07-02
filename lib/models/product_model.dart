

class Product {
  final String codigo, nombre, descripcion, tipoUnidad, observacion;
  final int cantidadBodega;
  final double precioUnitario;
  final int usuarioId;

  Product({
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.tipoUnidad,
    required this.cantidadBodega,
    required this.precioUnitario,
    required this.observacion,
    required this.usuarioId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    double parsePrecio(dynamic value) {
      if (value == null) return 0.0;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return Product(
      codigo: json['codigo'] ?? '',
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      tipoUnidad: json['tipo_unidad'] ?? '',
      cantidadBodega: json['cantidad_bodega'] ?? 0,
      precioUnitario: parsePrecio(json['precio_unitario']),
      observacion: json['observacion'] ?? '',
      usuarioId: json['usuario_id'] ?? 0,
    );
  }
}