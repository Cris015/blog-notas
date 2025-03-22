class Nota {
  String titulo;
  String contenido;

  Nota({required this.titulo, required this.contenido});

  Map<String, dynamic> toJson() {
    return {'titulo': titulo, 'contenido': contenido};
  }

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      titulo: json['titulo'],
      contenido: json['contenido'],
    );
  }
}