import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.SystemStateVector

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure DissipationRate where
  total : ℝ
  turbulent : ℝ
  laminar : ℝ

def dissipationClosed (D : DissipationRate) : Prop :=
  D.total = D.turbulent + D.laminar

structure EnergyFlux where
  scale : ℝ
  flux : ℝ
  cascading : Prop

def fluxBalance (F : EnergyFlux) : Prop := F.flux ≤ 0

structure DissipationLayer where
  rate : DissipationRate
  flux : EnergyFlux
  layerClosed : dissipationClosed rate ∧ fluxBalance flux

theorem dissipation_layer_closure (L : DissipationLayer) : L.layerClosed := by
  exact L.layerClosed

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse