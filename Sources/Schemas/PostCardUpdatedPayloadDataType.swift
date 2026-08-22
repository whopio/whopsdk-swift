import Foundation

/// The card type.
public enum PostCardUpdatedPayloadDataType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}