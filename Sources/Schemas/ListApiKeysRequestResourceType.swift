import Foundation

public enum ListApiKeysRequestResourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case app
    case user
}