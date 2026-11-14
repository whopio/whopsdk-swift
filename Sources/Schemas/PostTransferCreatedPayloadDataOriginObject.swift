import Foundation

/// Whether the profile is a business account or a user.
public enum PostTransferCreatedPayloadDataOriginObject: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case user
}