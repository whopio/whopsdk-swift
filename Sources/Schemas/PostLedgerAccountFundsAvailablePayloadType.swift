import Foundation

/// The webhook event type
public enum PostLedgerAccountFundsAvailablePayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case ledgerAccountFundsAvailable = "ledger_account.funds_available"
}