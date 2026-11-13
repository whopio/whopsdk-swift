import Foundation

public enum ListExperimentsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case flagKey = "flag_key"
}