import Foundation

/// The types of ledgers that can be created.
public enum LedgerTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case primary
    case pool
}