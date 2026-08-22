import Foundation

/// The different approval statuses an account can have.
public enum PaymentsApprovalStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case approved
    case monitoring
    case rejected
}