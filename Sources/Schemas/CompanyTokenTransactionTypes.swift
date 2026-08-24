import Foundation

/// The type of token transaction
public enum CompanyTokenTransactionTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case add
    case subtract
    case transfer
}