import Foundation

public enum ListVerificationsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case updatedAt = "updated_at"
    case createdAt = "created_at"
}