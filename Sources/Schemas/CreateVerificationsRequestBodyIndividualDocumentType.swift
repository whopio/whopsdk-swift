import Foundation

/// Identity document being sent, when verifying with `documents`. Decides exactly which file slots to send: `id_card` → `id_card_front` + `id_card_back` + `selfie`; `drivers` → `drivers_front` + `drivers_back` + `selfie`; `residence_permit` → `residence_permit_front` + `residence_permit_back` + `selfie`; `passport` → `passport_front` + `selfie`. See [Identity documents](/developer/verification/identity-documents).
public enum CreateVerificationsRequestBodyIndividualDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case idCard = "id_card"
    case drivers
    case residencePermit = "residence_permit"
    case passport
}