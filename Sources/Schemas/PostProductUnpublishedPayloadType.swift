import Foundation

/// The webhook event type
public enum PostProductUnpublishedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case productUnpublished = "product.unpublished"
}