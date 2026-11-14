import Foundation

public enum UpdatePlansRequestThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case mandateIfRequired = "mandate_if_required"
    case frictionlessIfRequired = "frictionless_if_required"
}