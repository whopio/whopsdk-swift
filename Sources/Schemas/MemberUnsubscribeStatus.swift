import Foundation

/// `unsubscribed` once the member opts out of the account's marketing communications, `null` while they're subscribed. Only the member can change it.
public enum MemberUnsubscribeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case unsubscribed
}