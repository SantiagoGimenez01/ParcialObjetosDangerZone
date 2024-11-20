class Mision{
    const property habilidadesRequeridas = []
    const peligrosidad

    method serCumplidaPor(algo){
        if(!algo.puedeCumplir(self))
            throw new DomainException(message="No se puede llevar a cabo la mision")
        algo.recibirDanio(peligrosidad)
        algo.registrarMision()
    }
}