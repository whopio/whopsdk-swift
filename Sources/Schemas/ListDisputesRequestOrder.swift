import Foundation

public enum ListDisputesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case amount
    case evidenceDueAt = "evidence_due_at"
}