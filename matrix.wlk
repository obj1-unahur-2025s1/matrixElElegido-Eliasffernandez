object nave {
  const pasajeros = [neo,morfeo]
  method cantidadDePasajeros() = pasajeros.size()
  method pasajerosMayorVitalidad() = pasajeros.max({pax => pax.vitalidad()}) // pax va corriendo todos los elementos de la lista
  method estaEquilibrada(){
    return self.pasajerosMayorVitalidad().vitalidad() < self.pasajeroDeMenosVitalidad().vitalidad() * 2
  }  
  method pasajeroDeMenosVitalidad() = pasajeros.min({pax => pax.vitalidad()})
  method estaElElegido() = pasajeros.any({p => p.esElElegido()})
  method chocar(){
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }
  method acelerar(){
    self.pasajerosNoSonElElegido().forEach({p => p.saltar()})
  }
  method  pasajerosNoSonElElegido() = pasajeros.filter({p => !p.esElElegido()})
}
object neo{
    var energiaActual = 100
    method esElElegido() = true
    method  saltar(){
        energiaActual = energiaActual / 2
    }
    method vitalidad() = energiaActual * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  method esElElegido() = false
  method saltar(){
    vitalidad = 0.max(vitalidad - 1) //el valor minimo es 0
    estaCansado = not estaCansado // !estaCansado
  }
}

object trinity{
    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false

}