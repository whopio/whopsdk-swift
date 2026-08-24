import Foundation

/// The ceremony this challenge is for.
public enum ChallengePasskeysRequestChallengeType: String, Codable, Hashable, CaseIterable, Sendable {
    case registration
    case deletion
}