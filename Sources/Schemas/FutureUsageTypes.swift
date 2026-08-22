import Foundation

/// How a payment method will be charged after the buyer leaves — the same vocabulary as a confirmation token's setup_future_usage.
public enum FutureUsageTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case offSession = "off_session"
    case onSession = "on_session"
}