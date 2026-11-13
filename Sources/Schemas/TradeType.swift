import Foundation

/// `order` places one order: a perpetual order trades from the trading balance, a spot order swaps between USDT0 and the asset in the wallet. `deposit` bridges USDT0 from the wallet to the trading balance. `withdraw` sends USDC from the trading balance back to the wallet. `close` closes the whole position in one market with a market reduce-only order; when the account is then flat, a `withdraw` trade sends the trading balance back to the wallet.
public enum TradeType: String, Codable, Hashable, CaseIterable, Sendable {
    case close
    case order
    case deposit
    case withdraw
}