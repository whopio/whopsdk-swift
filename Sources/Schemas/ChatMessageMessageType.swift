import Foundation

public enum ChatMessageMessageType: String, Codable, Hashable, CaseIterable, Sendable {
    case regular
    case system
    case automated
}