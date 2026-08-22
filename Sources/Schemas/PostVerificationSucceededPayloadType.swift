import Foundation

/// The webhook event type
public enum PostVerificationSucceededPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case verificationSucceeded = "verification.succeeded"
}