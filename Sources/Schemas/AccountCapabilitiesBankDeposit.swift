import Foundation

/// Deposits by bank wire or ACH to the account's virtual bank account
public enum AccountCapabilitiesBankDeposit: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}