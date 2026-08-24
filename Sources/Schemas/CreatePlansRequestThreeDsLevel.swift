import Foundation

/// 3D Secure behavior for this plan. Send `null` to inherit the account default.
public enum CreatePlansRequestThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}