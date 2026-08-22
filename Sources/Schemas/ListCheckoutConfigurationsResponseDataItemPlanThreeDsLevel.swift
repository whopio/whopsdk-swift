import Foundation

/// 3D Secure behavior for this plan, or `null` to use the account default.
public enum ListCheckoutConfigurationsResponseDataItemPlanThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}