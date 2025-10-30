import packs.*
import beneficios.*

class Coordinador{
  var cantViajesRealizados
  var property estaMotivado 
  const property experiencia
  var property rol 
  
  method realizarViaje() {cantViajesRealizados += 1}
  method cambiarRol(unRol) {
    if(unRol == guia || unRol == asistenteLogistico || unRol == acompaniante)
      rol = unRol
    else
      throw new Exception(message="No es un rol válido")
  }
  method estaAltamenteCalificado() = cantViajesRealizados > 20 && rol.estaCalificado(self)
}
object guia{
  method estaCalificado(unCoordinador) = unCoordinador.estaMotivado()
}
object asistenteLogistico {
  method estaCalificado(unCoordinador) = unCoordinador.experiencia() >= 3
}
object acompaniante {  
  method estaCalificado(unCoordinador) = true
}