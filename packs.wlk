import cotizacionDeLaPapa-IgnacioMGallardo.impuestos.*
class PackDeViajes{
  //Asumo que la duración, el precio base y el coordinador del pack no va a cambiar, por eso los pongo como constantes
  const property duracion
  const property precioBase
  const property coordinador
  const property beneficiosAgregados = []

  method agregarBeneficio(unBeneficio) {beneficiosAgregados.add(unBeneficio)}
  method precioTotal() = precioBase + beneficiosAgregados.sum({b=> b.costo()})
}

class PackNacional inherits PackDeViajes{
  const property provinciaDestino //Es un string
  const property actividadesincluidas = [] //Las actividades son Strings

  method agregarActividad(unaActividad){actividadesincluidas.add(unaActividad)}
}
class PackInternacional inherits PackDeViajes{
  const property paisDestino
  override method precioTotal() = super() * 1.2
}

//COORDINADORES
class Coordinador{
  var cantViajesRealizados = 0
  //const estaMotivado = true
  const property experiencia
  var property rol //Estos son en String ("Guía", "Asistente Logístico" o "Acompañante")
  
  method realizarViaje() {cantViajesRealizados += 1}
  
  method cambiarRol(unRol) {
    if(unRol == "Guía" || unRol == "Asistente Logístico" || unRol == "Acompañante")
      rol = unRol
    else
      throw new Exception(message="No es un rol válido")
  }
}
//BENEFICIOS ESPECIALES
class BeneficiosEspeciales{
  const property tipo
  const property costo
  const property estaVigente
}