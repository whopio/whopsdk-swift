import Foundation

public enum ListMethodsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case created
    case active
    case broken
}