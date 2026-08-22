import Foundation

/// Transfers to other accounts
public enum AccountCapabilitiesTransfer: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}