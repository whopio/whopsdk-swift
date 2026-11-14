import Foundation

/// Outcome of this delivery attempt: `success` when the endpoint returned a 2xx response, `error` otherwise.
public enum WebhookDeliveryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case success
    case error
}