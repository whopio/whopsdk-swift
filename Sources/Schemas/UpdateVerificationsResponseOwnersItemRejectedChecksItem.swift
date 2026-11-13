import Foundation

public enum UpdateVerificationsResponseOwnersItemRejectedChecksItem: String, Codable, Hashable, CaseIterable, Sendable {
    case details
    case identityDocument = "identity_document"
    case selfie
}