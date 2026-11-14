import Foundation

/// Whether a banking-network tracking reference is available for this refund.
public enum RefundReferenceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case available
    case pending
    case unavailable
}