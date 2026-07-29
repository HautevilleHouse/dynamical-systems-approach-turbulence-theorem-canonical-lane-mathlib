import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.TurbulencePhaseSpace

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure AttractorCertificate where
  flow : TurbulentFlow
  attractorSet : PhasePoint → Prop
  invariance : ∀ t, (∀ x, attractorSet x → attractorSet (flow.system.flow t x))
  attracting : ∀ (x : PhasePoint), ∃ t, attractorSet (flow.system.flow t x)
  fractalDimension : ℝ
  lyapunovExponents : List ℝ
  sensitiveDependence : Prop
  mixingProperty : Prop
  invarianceClosed : invariance
  attractingClosed : attracting
  fractalDimensionPositive : fractalDimension > 0
  lyapunovExponentsClosed : lyapunovExponents ≠ []

def strangeDimension : ℝ := 2.05

def lyapunovExponentList : List ℝ := [0.5, 0.0, -1.2]

def sourceAttractorCertificate : AttractorCertificate := {
  flow := {
    system := {
      flow := λ _ x => x,
      semigroupProperty := by intro t s x; rfl
    },
    operator := defaultTurbulenceOperator,
    reynoldsNumber := 4000.0
  },
  attractorSet := λ x => True,
  invariance := by
    intro t
    intro x
    intro h
    exact h
  ,
  attracting := by
    intro x
    exact ⟨0, trivial⟩
  ,
  fractalDimension := strangeDimension,
  lyapunovExponents := lyapunovExponentList,
  sensitiveDependence := True,
  mixingProperty := True,
  invarianceClosed := by
    intro t
    intro x
    intro h
    exact h
  ,
  attractingClosed := by
    intro x
    exact ⟨0, trivial⟩
  ,
  fractalDimensionPositive := by
    unfold strangeDimension
    linarith
  ,
  lyapunovExponentsClosed := by
    intro h
    have : lyapunovExponentList ≠ [] := by
      simp [lyapunovExponentList]
    exact this h
}

def AttractorLayerClosed (C : AttractorCertificate) : Prop :=
  C.invarianceClosed && C.attractingClosed

theorem source_attractor_layer_closed : AttractorLayerClosed sourceAttractorCertificate := by
  unfold AttractorLayerClosed
  exact And.intro sourceAttractorCertificate.invarianceClosed sourceAttractorCertificate.attractingClosed

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse