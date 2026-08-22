import Foundation

/// The card type.
public enum PostCardFrozenPayloadDataType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}