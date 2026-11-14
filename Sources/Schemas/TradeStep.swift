import Foundation

/// What a live trade is doing now: `depositing` while the wallet's USDT0 is being sent to the bridge, `landing` once sent and until it reaches the trading balance, `placing` while the order or close is with the venue, `withdrawing` while USDC heads back to the wallet, `returning` while money an unfilled order bridged in goes back. A spot order is `quoting` while the swap is priced, `swapping` while it runs onchain, and `crediting` until the new balance shows in the wallet. `null` once the trade is no longer pending or processing.
public enum TradeStep: String, Codable, Hashable, CaseIterable, Sendable {
    case depositing
    case landing
    case placing
    case withdrawing
    case returning
    case quoting
    case swapping
    case crediting
}