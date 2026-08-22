import Foundation

public enum ListResolutionCenterCasesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case responseDueAt = "response_due_at"
}