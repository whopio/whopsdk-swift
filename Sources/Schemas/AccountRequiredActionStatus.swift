import Foundation

/// required (act now) or pending (under review)
public enum AccountRequiredActionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case required
    case pending
}