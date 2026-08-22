import Foundation

/// 3D Secure behavior for this plan; `null` inherits the account default.
public enum PlanThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}