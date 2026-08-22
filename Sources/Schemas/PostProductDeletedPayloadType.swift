import Foundation

/// The webhook event type
public enum PostProductDeletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case productDeleted = "product.deleted"
}