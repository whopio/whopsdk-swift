import Foundation

/// The card type.
public enum PostCardCanceledPayloadDataType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}