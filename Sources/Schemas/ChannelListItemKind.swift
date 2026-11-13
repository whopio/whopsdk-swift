import Foundation

public enum ChannelListItemKind: String, Codable, Hashable, CaseIterable, Sendable {
    case `private`
    case community
    case support
}