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
  method esPackPremium() = duracion > 10 && coordinador.estaAltamenteCalificado()
}
class PackProvincial inherits PackNacional{
  const property ciudadesAVisitar = []

  method esPackPremium() = actividadesincluidas.count() >= 4 && ciudadesAVisitar.count() > 5 && beneficiosAgregados.count({b=> b.estaVigente()}) >= 3
  override method precioTotal() = super() * 1.05
}