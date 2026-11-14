import Foundation

/// `unsubscribed` to opt out of the account's marketing, `null` to opt back in. Only the member can set it, with `user:notifications:update`.
public enum UpdateMembersRequestUnsubscribeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case unsubscribed
}