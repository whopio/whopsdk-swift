import Foundation

/// The card type.
public enum PostCardCreatedPayloadDataType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}