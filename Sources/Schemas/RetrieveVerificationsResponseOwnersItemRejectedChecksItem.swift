import Foundation

public enum RetrieveVerificationsResponseOwnersItemRejectedChecksItem: String, Codable, Hashable, CaseIterable, Sendable {
    case details
    case identityDocument = "identity_document"
    case selfie
}