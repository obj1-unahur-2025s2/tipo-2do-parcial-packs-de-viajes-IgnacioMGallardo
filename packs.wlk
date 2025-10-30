import cotizacionDeLaPapa-IgnacioMGallardo.impuestos.*
class PackDeViajes{
  //Asumo que la duración, el precio base y el coordinador del pack no va a cambiar, por eso los pongo como constantes
  const property duracion
  const property precioBase
  const property coordinador
  const property beneficiosAgregados = []

  method agregarBeneficio(unBeneficio) {beneficiosAgregados.add(unBeneficio)}
  method precioTotal() = precioBase + beneficiosAgregados.sum({b=>b.costo()})
}

class PackNacional inherits PackDeViajes{
  const property provinciaDestino //Es un string
  const property actividadesincluidas = [] //Las actividades son Strings

  method agregarActividad(unaActividad){actividadesincluidas.add(unaActividad)}
  
}
class PackInternacional inherits PackDeViajes{
  const property paisDestino //Es un string
  override method precioTotal() = super() * 1.2
}
class PackProvincial inherits PackNacional{
  const property ciudadesAVisitar = []

  method esPackPremium() = actividadesincluidas.count() >= 4 && ciudadesAVisitar.count() > 5 && beneficiosAgregados.count({b=> b.estaVigente()}) >= 3
}

//COORDINADORES
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
//BENEFICIOS ESPECIALES
class BeneficiosEspeciales{
  const property tipo
  const costo
  const estaVigente

  method costo() = if(estaVigente) costo else 0
}