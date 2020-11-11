class Curso {
  String nombre;
  String descripcion;
  int creditos;

  DateTime fechaInicio;

  Curso({
    this.nombre,
    this.descripcion,
    this.creditos,
    this.fechaInicio,
  });

  String getNombre() {
    return nombre;
  }

  String getDescripcion() {
    return descripcion;
  }

  int getCreditos() {
    return creditos;
  }

  DateTime getFechaInicio() {
    return fechaInicio;
  }

  setNombre(String nombre) {
    this.nombre = nombre;
  }

  setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  setCreditos(int creditos) {
    creditos = creditos;
  }

  setFechaInicio(DateTime fechaInicio) {
    fechaInicio = fechaInicio;
  }
}
