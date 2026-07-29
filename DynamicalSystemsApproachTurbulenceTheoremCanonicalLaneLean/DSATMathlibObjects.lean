import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure TurbulenceTheoremObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure AdmittedTurbulenceObject where
  object : TurbulenceTheoremObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

structure TurbulenceClosureState where
  object : AdmittedTurbulenceObject

def turbulenceTheoremObject : TurbulenceTheoremObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := sourceTheoremBoundary.claimBoundary
}

def NativeBridgeClosed (O : AdmittedTurbulenceObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧ O.object.theoremObject = sourceDescription

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse