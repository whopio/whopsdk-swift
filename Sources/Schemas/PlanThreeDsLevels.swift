import Foundation

/// The 3D Secure behavior for a plan.
public enum PlanThreeDsLevels: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case frictionless
}