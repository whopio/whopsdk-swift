import Foundation

/// Channel kind. `private` is a one-to-one or group conversation, `community` creates a Chat experience on the account, and `support` opens a conversation between the account and a customer.
public enum CreateChannelsRequestKind: String, Codable, Hashable, CaseIterable, Sendable {
    case `private`
    case community
    case support
}