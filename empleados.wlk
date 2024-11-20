class Empleado{
  var salud
  const habilidades = []
  var tipo

  method saludCritica() = tipo.saludCritica()
  method estaIncapacitado() = salud < self.saludCritica()
  method posee(habilidad) = habilidades.contains(habilidad)
  method puedeUsar(habilidad) = !self.estaIncapacitado() && self.posee(habilidad)
  method puedeCumplir(mision) = mision.habilidadesRequeridas().all({habilidad => self.puedeUsar(habilidad)})
  method recibirDanio(cantidad){ salud = (salud - cantidad).max(0) }
  method sobrevive() = salud > 0
  method cumplir(mision) = mision.serCumplidaPor(self)
  method registrar(mision){
    if(self.sobrevive())
        tipo.misionCompletada(self, mision)
  }
  method ascender(){ tipo = espia }
  method aprender(habilidadesNuevas){
    habilidades.addAll(habilidadesNuevas)
  }
}

class Jefe inherits Empleado{
  const subordinados = []

  override method posee(habilidad) = super(habilidad) || subordinados.any({subordinado => subordinado.posee(habilidad)})
}

class Equipo{
    const miembros = []

    method puedeCumplir(mision) = miembros.any({miembro => miembro.puedeCumplir(mision)})
    method recibirDanio(cantidad){ miembros.forEach({miembro => miembro.recibirDanio(cantidad/3)}) }
    method cumplir(mision) = mision.serCumplidaPor(self)
}

class Oficinista{
    var estrellas = 0

    method saludCritica() = 40 - 5 * estrellas
    method misionCompletada(empleado, mision){ 
        estrellas += 1 
        if(estrellas == 3)
            empleado.ascender()
    }
}

object espia{

    method saludCritica() = 15
    method misionCompletada(empleado, mision){
        empleado.aprenderHabilidades(mision.habilidadesRequeridas())
    }
}