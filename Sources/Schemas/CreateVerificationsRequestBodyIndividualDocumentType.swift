import Foundation

/// Identity document being sent, when verifying with `documents`. Decides exactly which file slots to send: `ID_CARD` → `id_card_front` + `id_card_back` + `selfie`; `DRIVERS` → `drivers_front` + `drivers_back` + `selfie`; `RESIDENCE_PERMIT` → `residence_permit_front` + `residence_permit_back` + `selfie`; `PASSPORT` → `passport_front` + `selfie`. See [Identity documents](/developer/verification/identity-documents).
public enum CreateVerificationsRequestBodyIndividualDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case idCard = "ID_CARD"
    case drivers = "DRIVERS"
    case residencePermit = "RESIDENCE_PERMIT"
    case passport = "PASSPORT"
}