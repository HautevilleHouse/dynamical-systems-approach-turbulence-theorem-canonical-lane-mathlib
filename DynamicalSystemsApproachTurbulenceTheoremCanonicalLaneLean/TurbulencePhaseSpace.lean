import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fin.Basic

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

abbrev PhasePoint : Type := Fin 3 → ℝ
abbrev Time : Type := ℝ
abbrev FlowMap : Type := Time → PhasePoint → PhasePoint

structure DynamicalSystem where
  flow : FlowMap
  semigroupProperty : ∀ t s x, flow t (flow s x) = flow (t + s) x

structure TurbulenceOperator where
  diffusion : FlowMap → FlowMap
  advection : FlowMap → FlowMap
  forcing : FlowMap → FlowMap

def defaultDiffusion (f : FlowMap) : FlowMap := f
def defaultAdvection (f : FlowMap) : FlowMap := f
def defaultForcing (f : FlowMap) : FlowMap := f

def defaultTurbulenceOperator : TurbulenceOperator := {
  diffusion := defaultDiffusion,
  advection := defaultAdvection,
  forcing := defaultForcing
}

structure TurbulentFlow where
  system : DynamicalSystem
  operator : TurbulenceOperator
  reynoldsNumber : ℝ

structure EquilibriumState where
  point : PhasePoint
  stabilityMargin : ℝ

def phaseSpaceVolume : Type := ℝ

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse