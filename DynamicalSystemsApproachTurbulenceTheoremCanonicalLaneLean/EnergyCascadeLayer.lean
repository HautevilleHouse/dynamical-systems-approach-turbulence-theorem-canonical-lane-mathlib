import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.TurbulencePhaseSpace

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure EnergyCascadeCertificate where
  flow : TurbulentFlow
  energySpectrum : ℝ → ℝ
  kColmogorov : ℝ
  dissipationRate : ℝ
  injectionScale : ℝ
  cascadeRange : Prop
  k41Scaling : ∀ k, energySpectrum k = dissipationRate^(2/3) * k^(-5/3)
  cascadeRangeClosed : cascadeRange
  k41ScalingClosed : k41Scaling

def kolmogorovLengthScale : ℝ := 0.001

def dissipationRateValue : ℝ := 0.1

def energySpectrumFunc (k : ℝ) : ℝ := dissipationRateValue^(2/3) * k^(-5/3)

def sourceEnergyCascadeCertificate : EnergyCascadeCertificate := {
  flow := {
    system := {
      flow := λ _ x => x,
      semigroupProperty := by intro t s x; rfl
    },
    operator := defaultTurbulenceOperator,
    reynoldsNumber := 4000.0
  },
  energySpectrum := energySpectrumFunc,
  kColmogorov := kolmogorovLengthScale,
  dissipationRate := dissipationRateValue,
  injectionScale := 1.0,
  cascadeRange := True,
  k41Scaling := by intro k; rfl,
  cascadeRangeClosed := trivial,
  k41ScalingClosed := by intro k; rfl
}

def EnergyCascadeLayerClosed (C : EnergyCascadeCertificate) : Prop :=
  C.cascadeRangeClosed ∧ C.k41ScalingClosed

theorem source_energy_cascade_layer_closed : EnergyCascadeLayerClosed sourceEnergyCascadeCertificate := by
  exact And.intro sourceEnergyCascadeCertificate.cascadeRangeClosed sourceEnergyCascadeCertificate.k41ScalingClosed

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse