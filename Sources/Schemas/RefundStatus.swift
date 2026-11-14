import Foundation

/// Where the refund stands with the processor: `pending`, `requires_action`, `succeeded`, `failed`, or `canceled`.
public enum RefundStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case requiresAction = "requires_action"
    case succeeded
    case failed
    case canceled
}