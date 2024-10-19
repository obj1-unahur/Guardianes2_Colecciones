object liga {
   const candidatos = []
   const guardianes = []
   var property rolDestacado = inicial

   method agregarCandidato(c){
    candidatos.add(c)
   }
   
   method tieneGuardian(alguien) = guardianes.contains(alguien)

   method candidatosQuePuedenSer(rol) = 
      candidatos.filter{c=> rol.cumple(c)}

   method hacerLaEvaluacion(rol) {
    const nuevos = self.candidatosQuePuedenSer(rol)
    guardianes.addAll(nuevos)
    candidatos.removeAll(nuevos)
   }
   method entrenamiento(){
    candidatos.forEach{c=>c.entrenar()}
   }
   method fuerzaTotal() = guardianes.sum{g=>g.fuerza()}
   method superaAtaque(valor) = self.fuerzaTotal() > 2 * valor
}

object helia{
    method fuerza() = 22
    method estudiosAvanzados() = false
    method entrenar(){
        // no hace nada
    }
}

object astro{
    var armas = 0
    method fuerza() = armas * 10
    method estudiosAvanzados() = armas > 5
    method entrenar() {
        armas = armas +1
    }
}

object zoe{
    const roles = #{}
    method fuerza() = 8 + roles.size()
    method estudiosAvanzados() = roles.contains(estratega)
    method entrenar(){
        roles.add(liga.rolDestacado())
    }
}

object ayudante{
    var property minimo = 0
    var property maximo = 100
    method cumple(candidato) = candidato.fuerza().between(minimo, maximo) 
}

object inicial{
    method cumple(candidato) = true
}

object estratega{
    method cumple(candidato) = candidato.estudiosAvanzados()
}
