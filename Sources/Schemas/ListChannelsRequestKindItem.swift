import Foundation

public enum ListChannelsRequestKindItem: String, Codable, Hashable, CaseIterable, Sendable {
    case `private`
    case community
    case support
}