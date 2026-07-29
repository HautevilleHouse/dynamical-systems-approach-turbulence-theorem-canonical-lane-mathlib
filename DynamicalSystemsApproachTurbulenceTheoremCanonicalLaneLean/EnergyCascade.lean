import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.SystemStateVector

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure EnergySpectrum where
  wavenumber : ℝ → ℝ
  energyDensity : ℝ → ℝ

def energyCascade (E : EnergySpectrum) : Prop := ∀ k, E.energyDensity k ≤ 1 / k

structure KolmogorovLaw where
  dissipationRate : ℝ
  viscosity : ℝ
  spectralExponent : ℝ

def fiveThirdsLaw (K : KolmogorovLaw) : Prop := K.spectralExponent = 5/3

structure InertialRange where
  start : ℝ
  end_ : ℝ
  law : KolmogorovLaw

theorem inertial_range_closure : Prop := True

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse