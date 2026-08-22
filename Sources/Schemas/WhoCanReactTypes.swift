import Foundation

/// Who can react on a chat feed
public enum WhoCanReactTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case noOne = "no_one"
}