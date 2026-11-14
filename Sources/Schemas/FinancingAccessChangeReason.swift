import Foundation

/// Why financing access was removed.
public enum FinancingAccessChangeReason: String, Codable, Hashable, CaseIterable, Sendable {
    case highDisputeRate = "high_dispute_rate"
}