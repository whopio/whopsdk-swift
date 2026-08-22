import Foundation

/// Bank payins: debits, transfers, and local bank rails
public enum AccountCapabilitiesAcceptBankPayments: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}