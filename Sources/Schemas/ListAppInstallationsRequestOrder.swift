import Foundation

public enum ListAppInstallationsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case name
}