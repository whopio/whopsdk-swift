import Foundation

/// Where the money is when the trade did not complete as asked: `wallet`, `trading_account`, or `unknown` while a person checks it. `null` otherwise.
public enum TradeFundsLocation: String, Codable, Hashable, CaseIterable, Sendable {
    case wallet
    case tradingAccount = "trading_account"
    case unknown
}