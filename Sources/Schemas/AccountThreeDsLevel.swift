import Foundation

/// Account-level 3D Secure behavior. `mandate_challenge` requires cardholder verification on supported card payments; `null` uses the standard checkout flow.
public enum AccountThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
}