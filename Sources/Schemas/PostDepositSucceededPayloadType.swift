import Foundation

/// The webhook event type
public enum PostDepositSucceededPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case depositSucceeded = "deposit.succeeded"
}