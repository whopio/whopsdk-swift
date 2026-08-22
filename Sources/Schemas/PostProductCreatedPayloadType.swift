import Foundation

/// The webhook event type
public enum PostProductCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case productCreated = "product.created"
}