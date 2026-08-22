import Foundation

/// 3D Secure behavior for this checkout, or `null` to use the account default.
public enum CreateCheckoutConfigurationsResponseThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}