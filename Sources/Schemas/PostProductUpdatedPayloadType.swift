import Foundation

/// The webhook event type
public enum PostProductUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case productUpdated = "product.updated"
}