import packs.*
import coordinadores.*

class BeneficiosEspeciales{
  const property tipo
  const costo
  const estaVigente

  method costo() = if(estaVigente) costo else 0
}