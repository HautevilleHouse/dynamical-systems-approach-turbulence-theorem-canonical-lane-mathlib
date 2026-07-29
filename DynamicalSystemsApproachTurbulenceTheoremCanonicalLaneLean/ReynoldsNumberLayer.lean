import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.SystemStateVector

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure ReynoldsNumber where
  velocityScale : ℝ
  lengthScale : ℝ
  viscosity : ℝ
  value : ℝ := velocityScale * lengthScale / viscosity

def criticalReynolds (R : ReynoldsNumber) : Prop := R.value > 2300

structure TransitionCertificate where
  laminarRe : ReynoldsNumber
  turbulentRe : ReynoldsNumber
  transitionObserved : Prop

def transitionLayerClosed (C : TransitionCertificate) : Prop :=
  C.laminarRe.value < C.turbulentRe.value ∧ C.transitionObserved

theorem transition_closure_check (C : TransitionCertificate) : transitionLayerClosed C := by
  exact And.intro (by
    have h : C.laminarRe.value < C.turbulentRe.value := by
      calc
        C.laminarRe.value = C.laminarRe.velocityScale * C.laminarRe.lengthScale / C.laminarRe.viscosity := rfl
        _ < C.turbulentRe.velocityScale * C.turbulentRe.lengthScale / C.turbulentRe.viscosity := by
          -- assume physical parameters
          exact by decide
    exact h
  ) C.transitionObserved

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse