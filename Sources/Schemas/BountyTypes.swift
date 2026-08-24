import Foundation

/// The available bounty implementation types.
public enum BountyTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case classic
    case userFunded = "user_funded"
    case workforce
}