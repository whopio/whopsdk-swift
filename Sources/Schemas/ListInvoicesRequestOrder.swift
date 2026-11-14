import Foundation

public enum ListInvoicesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case dueAt = "due_at"
    case status
    case scheduledSendAt = "scheduled_send_at"
}