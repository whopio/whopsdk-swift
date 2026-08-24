import Foundation

/// 3D Secure behavior for this checkout.
public enum CreateCheckoutConfigurationsRequestThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}