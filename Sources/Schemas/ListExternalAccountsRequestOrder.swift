import Foundation

public enum ListExternalAccountsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case displayOrder = "display_order"
    case createdAt = "created_at"
}