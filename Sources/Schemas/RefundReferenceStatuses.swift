import Foundation

/// The status of the refund reference.
public enum RefundReferenceStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case available
    case pending
    case unavailable
}