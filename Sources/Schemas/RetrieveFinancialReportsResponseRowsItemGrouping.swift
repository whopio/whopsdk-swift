import Foundation

/// The family the row's `line_category` rolls up into. Balance summary rows are always `balance`.
public enum RetrieveFinancialReportsResponseRowsItemGrouping: String, Codable, Hashable, CaseIterable, Sendable {
    case advertising
    case affiliatesAndRevshare = "affiliates_and_revshare"
    case airdrops
    case badDebt = "bad_debt"
    case balance
    case capital
    case clawbacks
    case crypto
    case disputes
    case fees
    case fx
    case legacy
    case levelsPoints = "levels_points"
    case misc
    case operationalCosts = "operational_costs"
    case other
    case payments
    case platformCredits = "platform_credits"
    case refunds
    case reserves
    case subaccounts
    case transfers
    case walletsAndBalance = "wallets_and_balance"
    case withdrawals
}