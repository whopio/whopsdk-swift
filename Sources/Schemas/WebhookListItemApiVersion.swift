import Foundation

/// The API version used to format payloads sent to this webhook endpoint.
public enum WebhookListItemApiVersion: String, Codable, Hashable, CaseIterable, Sendable {
    case v1
    case v2
    case v5
}