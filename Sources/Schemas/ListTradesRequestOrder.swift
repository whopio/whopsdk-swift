import Foundation

public enum ListTradesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case updatedAt = "updated_at"
}