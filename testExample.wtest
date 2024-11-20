class Empleado{
  var salud
  const habilidades = []

  method saludCritica()
  method estaIncapacitado() = salud < self.saludCritica()
  method posee(habilidad) = habilidades.contains(habilidad)
  method puedeUsar(habilidad) = !self.estaIncapacitado() && self.posee(habilidad)
}

class Jefe inherits Empleado{
  const subordinados = []

  override method posee(habilidad) = super(habilidad) || subordinados.any({subordinado => subordinado.posee(habilidad)})
}