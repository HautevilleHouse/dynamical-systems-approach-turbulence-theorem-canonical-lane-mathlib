import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse