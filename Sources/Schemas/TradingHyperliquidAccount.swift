import Foundation

public struct TradingHyperliquidAccount: Codable, Hashable, Sendable {
    /// Lowercase wallet address that holds the Hyperliquid account.
    public let address: String
    /// USDT0 in the Whop wallet on Plasma that a `deposit` trade can move into this account, as a decimal string. `null` when the chain could not be read.
    public let depositable: Nullable<String>
    /// Account value and margin across the main exchange and the `xyz` markets, read from Hyperliquid at most once a second. `null` when Hyperliquid could not be read. Use `websocket_subscriptions` for live updates.
    public let marginSummary: Nullable<TradingMarginSummary>
    public let positions: Nullable<[TradingPosition]>
    public let websocketSubscriptions: [TradingWebsocketSubscription]
    /// Hyperliquid WebSocket URL to connect to directly for live updates.
    public let websocketUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: String,
        depositable: Nullable<String>,
        marginSummary: Nullable<TradingMarginSummary>,
        positions: Nullable<[TradingPosition]>,
        websocketSubscriptions: [TradingWebsocketSubscription],
        websocketUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.depositable = depositable
        self.marginSummary = marginSummary
        self.positions = positions
        self.websocketSubscriptions = websocketSubscriptions
        self.websocketUrl = websocketUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.depositable = try container.decode(Nullable<String>.self, forKey: .depositable)
        self.marginSummary = try container.decode(Nullable<TradingMarginSummary>.self, forKey: .marginSummary)
        self.positions = try container.decode(Nullable<[TradingPosition]>.self, forKey: .positions)
        self.websocketSubscriptions = try container.decode([TradingWebsocketSubscription].self, forKey: .websocketSubscriptions)
        self.websocketUrl = try container.decode(String.self, forKey: .websocketUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.depositable, forKey: .depositable)
        try container.encode(self.marginSummary, forKey: .marginSummary)
        try container.encode(self.positions, forKey: .positions)
        try container.encode(self.websocketSubscriptions, forKey: .websocketSubscriptions)
        try container.encode(self.websocketUrl, forKey: .websocketUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case depositable
        case marginSummary = "margin_summary"
        case positions
        case websocketSubscriptions = "websocket_subscriptions"
        case websocketUrl = "websocket_url"
    }
}