object liga {
  const property candidatos=[]
  const property guardianes=[]
  var property rol = inicial

  method entrenar(){
    candidatos.forEach({candidato=> candidato.entrenar()})
  }

   method entrenar2(){
    candidatos.forEach({candidato=> candidato.entrenar2(self)})
  }

  method unirse() {
    const superaronEvaluzacion = self.superanEvaluacion()
    guardianes.addAll(superaronEvaluzacion)
    candidatos.removeAll(superaronEvaluzacion)
  }

  method superanEvaluacion() = candidatos.filter({
      candidato => rol.evaluar(candidato)
    })

  method fuerzaTotal() {
    return guardianes.sum({ guardian => guardian.fuerza()})
  }

  method soportAtaque(unValor) {
    return self.fuerzaTotal() > 2 * unValor
  }
}

object ayudante {
  var property min = 100
  var property max = 0
  method evaluar(candidato){
    return candidato.fuerza().between(min, max)
  }
}

object estratega {
  method evaluar(candidato) {
    return candidato.estudiosAvanzados()
  }
}
object inicial {
  method evaluar(candidato){
    return true
  }
}

object helia {
  const property fuerza = 22
  method estudiosAvanzados() = false
  method entrenar() {}
  method entrenar2(liga) {}
}

object astro {
  var armas = 0
  method entrenar() {
    armas += 1
  }
    method entrenar2(liga) {
    armas += 1
  }
  method fuerza() = 10 * armas
  method estudiosAvanzados() = armas > 5
}

object zoe {
  const property cursos = #{}
  method entrenar(){
    cursos.add(liga.rol())
  }

  method entrenar2(liga){
    cursos.add(liga.rol())
  }
  method estudiosAvanzados() {
    return cursos.contains(liga.rol())
  }
  method fuerza() = 50 + cursos.size()
}