import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

abbrev Time := ℝ
abbrev StateSpace := ℕ → ℝ

structure SystemState where
  time : Time
  velocity : StateSpace
  forcing : StateSpace

structure SystemFunction where
  nonlinearTerm : SystemState → SystemState
  dissipation : SystemState → SystemState
  forcingTerm : SystemState → SystemState

structure NavierStokesOperator where
  dissipation : ℝ
  viscosity : ℝ

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse