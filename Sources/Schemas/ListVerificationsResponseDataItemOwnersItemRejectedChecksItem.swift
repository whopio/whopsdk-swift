import Foundation

public enum ListVerificationsResponseDataItemOwnersItemRejectedChecksItem: String, Codable, Hashable, CaseIterable, Sendable {
    case details
    case identityDocument = "identity_document"
    case selfie
}