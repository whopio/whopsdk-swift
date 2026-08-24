import Foundation

/// The family the row's `line_category` rolls up into. Balance summary rows are always `balance`.
public enum GetFinancialReportResponseRowsItemGrouping: String, Codable, Hashable, CaseIterable, Sendable {
    case advertising
    case affiliatesAndRevshare = "affiliates_and_revshare"
    case airdrops
    case badDebt = "bad_debt"
    case balance
    case clawbacks
    case connectedAccounts = "connected_accounts"
    case crypto
    case disputes
    case fees
    case fx
    case legacy
    case misc
    case other
    case payments
    case refunds
    case reserves
    case transfers
    case walletsAndBalance = "wallets_and_balance"
    case withdrawals
}