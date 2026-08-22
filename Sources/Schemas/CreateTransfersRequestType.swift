import Foundation

/// The kind of money movement, which decides what comes back. Defaults to ledger. `ledger` moves credit between two Whop balances and returns a `transfer`; `wallet_send` sends USDT from the origin account's Ethereum wallet and returns a `send`; `claim_link` funds a shareable link anyone with the URL can redeem and returns a `claim_link`. A `ledger` transfer from a stablecoin-rails account settles on-chain when covered, and still returns a `transfer`.
public enum CreateTransfersRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case ledger
    case walletSend = "wallet_send"
    case claimLink = "claim_link"
}