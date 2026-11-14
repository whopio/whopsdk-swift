import Foundation

public enum ListEmailAddressesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case address
}