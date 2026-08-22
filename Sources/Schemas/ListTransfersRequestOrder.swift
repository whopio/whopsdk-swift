import Foundation

public enum ListTransfersRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case amount
}