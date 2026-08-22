import Foundation

/// The different statuses for a Refund object
public enum RefundStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case requiresAction = "requires_action"
    case succeeded
    case failed
    case canceled
}