import packs.*
import beneficios.*

class Coordinador{
  const cantViajesRealizados
  const property estaMotivado 
  const property experiencia
  var rol
  const rolesValidos = #{guia, asistenteLogistico, acompaniante}
  
  
  method experiencia() = experiencia
  method cambiarRol(unRol) {
    if(rolesValidos.contains(unRol))
      rol = unRol
    else
      throw new Exception(message="El rol seleccionado no es un rol vigente por el momento")
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