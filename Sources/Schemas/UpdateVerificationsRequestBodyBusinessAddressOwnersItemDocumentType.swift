import Foundation

/// Identity document in `documents`. Decides which slots to send: `id_card` → `id_card_front` + `id_card_back`; `drivers` → `drivers_front` + `drivers_back`; `residence_permit` → `residence_permit_front` + `residence_permit_back`; `passport` → `passport_front`. Every type also takes `selfie`.
public enum UpdateVerificationsRequestBodyBusinessAddressOwnersItemDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case idCard = "id_card"
    case drivers
    case residencePermit = "residence_permit"
    case passport
}