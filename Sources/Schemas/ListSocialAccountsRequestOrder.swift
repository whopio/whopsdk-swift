import Foundation

public enum ListSocialAccountsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case displayOrder = "display_order"
    case createdAt = "created_at"
}