import Foundation

public enum ChannelKind: String, Codable, Hashable, CaseIterable, Sendable {
    case `private`
    case community
    case support
}