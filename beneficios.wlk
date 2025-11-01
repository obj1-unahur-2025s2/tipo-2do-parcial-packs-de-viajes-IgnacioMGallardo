import packs.*
import coordinadores.*

class BeneficiosEspeciales{
  const property tipo
  const costo
  var estaVigente

  method costo() = if(estaVigente) costo else 0
}
object trasladoPrivado {
  
}
object accesoVIP {
  
}
object segurosAdicionales {
  
}