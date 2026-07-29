import canonicalLaneMathlib.AdmissibleClass
import DSATRegularityEndpointLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean

structure TurbulenceAnalyticCertificate where
  substrate : DSATMathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  energyLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  energyLayerClosedProof : energyLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceTurbulenceAnalyticCertificate : TurbulenceAnalyticCertificate := {
  substrate := dsatMathlibPDESubstrate
  operatorsClosed := TurbulenceEquationClosed primitiveFlow
  weakLayerClosed := LerayHopfEnvelopeClosed sourceLerayHopfEnvelope
  energyLayerClosed := EnergyEnstrophyClosed sourceEnergyEnstrophyCertificate
  compactnessLayerClosed := CompactnessRigidityClosed sourceCompactnessRigidityCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := turbulenceCommonCoreProjectionLawAvailable ∧ turbulenceCommonCoreCarriageLawAvailable ∧ turbulenceCommonCoreIdempotenceAvailable
  operatorsClosedProof := primitive_flow_equation_closed_checked
  weakLayerClosedProof := source_leray_hopf_envelope_closed
  energyLayerClosedProof := source_energy_enstrophy_closed
  compactnessLayerClosedProof := source_compactness_rigidity_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := And.intro turbulence_common_core_projection_law_checked
    (And.intro turbulence_common_core_carriage_law_checked turbulence_common_core_idempotence_checked)
}

def TurbulenceAnalyticCertificateClosed (C : TurbulenceAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.energyLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_turbulence_analytic_certificate_closed :
    TurbulenceAnalyticCertificateClosed sourceTurbulenceAnalyticCertificate := by
  exact And.intro sourceTurbulenceAnalyticCertificate.operatorsClosedProof
    (And.intro sourceTurbulenceAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceTurbulenceAnalyticCertificate.energyLayerClosedProof
        (And.intro sourceTurbulenceAnalyticCertificate.compactnessLayerClosedProof
          (And.intro sourceTurbulenceAnalyticCertificate.endpointLayerClosedProof
            sourceTurbulenceAnalyticCertificate.canonicalCarriageImportedProof))))

end DynamicalSystemsApproachTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse