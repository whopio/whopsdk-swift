import Foundation

/// 3D Secure behavior for the inline plan, or `null` to use the account default.
public enum CreateCheckoutConfigurationsRequestPlanThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}