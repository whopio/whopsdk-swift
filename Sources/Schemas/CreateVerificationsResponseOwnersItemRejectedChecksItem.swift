import Foundation

public enum CreateVerificationsResponseOwnersItemRejectedChecksItem: String, Codable, Hashable, CaseIterable, Sendable {
    case details
    case identityDocument = "identity_document"
    case selfie
}