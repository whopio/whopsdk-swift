import Foundation

/// The webhook event type
public enum PostProductPublishedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case productPublished = "product.published"
}