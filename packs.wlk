class PackDeViajes{
  //Asumo que la duración, el precio base y el coordinador del pack no va a cambiar, por eso los pongo como constantes
  const property duracion
  const property precioBase
  const coordinador
  const property beneficiosAgregados = []

  method agregarBeneficio(unBeneficio) {beneficiosAgregados.add(unBeneficio)}
  method precioTotal() = precioBase + beneficiosAgregados.sum({b=>b.costo()})
  method esPremium()
}

class PackNacional inherits PackDeViajes{
  const property provinciaDestino //Es un string
  const property actividadesincluidas = [] //Las actividades son Strings

  method agregarActividad(unaActividad){actividadesincluidas.add(unaActividad)}
  override method esPremium() = duracion > 10 && coordinador.estaAltamenteCalificado()
  
}
class PackInternacional inherits PackDeViajes{
  const property paisDestino //Es un string
  const property esLugarDeInteres
  const tieneEscalas

  override method precioTotal() = super() * 1.2
  override method esPremium() = paisDestino.esLugarDeInteres() && duracion > 20 && !tieneEscalas
}
class PackProvincial inherits PackNacional{
  const property ciudadesAVisitar = []

  override method esPremium() = actividadesincluidas.count() >= 4 && ciudadesAVisitar.count() > 5 && beneficiosAgregados.count({b=> b.estaVigente()}) >= 3
  override method precioTotal() = if(self.esPremium()) super() * 1.05 else super()
}