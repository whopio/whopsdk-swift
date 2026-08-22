import Foundation

/// Network display name.
public enum CreateDepositsResponseMethodsCryptoItemName: String, Codable, Hashable, CaseIterable, Sendable {
    case ethereum = "Ethereum"
    case solana = "Solana"
    case base = "Base"
    case bnbSmartChain = "BNB Smart Chain"
    case hyperliquid = "Hyperliquid"
    case hypercore = "Hypercore"
    case megaEth = "MegaETH"
    case polygon = "Polygon"
    case plasma = "Plasma"
    case arbitrum = "Arbitrum"
}