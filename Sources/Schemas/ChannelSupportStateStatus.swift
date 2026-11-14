import Foundation

public enum ChannelSupportStateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case unresolved
    case resolved
}