import Foundation

/// `order` places one order. A perpetual order trades from the trading balance, setting cross `leverage` first; when the balance is short, it bridges the USDT0 it needs from the wallet first. A spot order swaps between USDT0 and the asset in the wallet. `deposit` bridges `amount` USDT0 from the wallet to the trading balance. `withdraw` sends `amount` USDC (or `all`) from the trading balance back to the wallet. `close` closes the whole position in `market` with a market reduce-only order; when the account is then flat, a `withdraw` trade sends the trading balance back to the wallet.
public enum CreateTradesRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case close
    case order
    case deposit
    case withdraw
}