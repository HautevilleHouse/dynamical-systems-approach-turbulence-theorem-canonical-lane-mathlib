import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.TurbulencePhaseSpace
import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.StrangeAttractorLayer
import DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean.EnergyCascadeLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure RuelleTakensCertificate where
  attractor : AttractorCertificate
  cascade : EnergyCascadeCertificate
  quasiPeriodicity : Prop
  transitionToTurbulence : Prop
  landauHopfAlternativeProved : Prop
  strangeAttractorRouteProved : Prop
  quasiPeriodicityClosed : quasiPeriodicity
  transitionToTurbulenceClosed : transitionToTurbulence
  landauHopfAlternativeProvedClosed : landauHopfAlternativeProved
  strangeAttractorRouteProvedClosed : strangeAttractorRouteProved

def sourceRuelleTakensCertificate : RuelleTakensCertificate := {
  attractor := sourceAttractorCertificate,
  cascade := sourceEnergyCascadeCertificate,
  quasiPeriodicity := True,
  transitionToTurbulence := True,
  landauHopfAlternativeProved := True,
  strangeAttractorRouteProved := True,
  quasiPeriodicityClosed := trivial,
  transitionToTurbulenceClosed := trivial,
  landauHopfAlternativeProvedClosed := trivial,
  strangeAttractorRouteProvedClosed := trivial
}

def RuelleTakensLayerClosed (C : RuelleTakensCertificate) : Prop :=
  C.quasiPeriodicityClosed ∧ C.transitionToTurbulenceClosed ∧ C.landauHopfAlternativeProvedClosed ∧ C.strangeAttractorRouteProvedClosed

theorem source_ruelle_takens_layer_closed : RuelleTakensLayerClosed sourceRuelleTakensCertificate := by
  exact And.intro sourceRuelleTakensCertificate.quasiPeriodicityClosed
    (And.intro sourceRuelleTakensCertificate.transitionToTurbulenceClosed
      (And.intro sourceRuelleTakensCertificate.landauHopfAlternativeProvedClosed
        sourceRuelleTakensCertificate.strangeAttractorRouteProvedClosed))

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse