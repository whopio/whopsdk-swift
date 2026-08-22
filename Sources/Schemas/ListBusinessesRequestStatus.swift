import Foundation

public enum ListBusinessesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case removed
}