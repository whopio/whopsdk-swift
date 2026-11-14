import Foundation

public struct TradingAccount: Codable, Hashable, Sendable {
    /// The account that owns this trading account, prefixed `biz_`. `null` when a user owns it.
    public let accountId: Nullable<String>
    /// Hyperliquid-specific state. Present when `provider` is `hyperliquid`, otherwise `null`.
    public let hyperliquid: Nullable<TradingHyperliquidAccount>
    /// The Whop wallet ID backing this trading account, prefixed `cwal_`.
    public let id: String
    public let object: TradingAccountObject
    /// Trading venue that holds the positions and orders.
    public let provider: TradingAccountProvider
    /// Spot holdings in the Whop wallet with their entry price and profit and loss. `null` when it could not be read.
    public let spot: Nullable<TradingSpotAccount>
    /// The user who owns this trading account, prefixed `user_`. `null` when an account owns it.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        hyperliquid: Nullable<TradingHyperliquidAccount>,
        id: String,
        object: TradingAccountObject,
        provider: TradingAccountProvider,
        spot: Nullable<TradingSpotAccount>,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.hyperliquid = hyperliquid
        self.id = id
        self.object = object
        self.provider = provider
        self.spot = spot
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.hyperliquid = try container.decode(Nullable<TradingHyperliquidAccount>.self, forKey: .hyperliquid)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(TradingAccountObject.self, forKey: .object)
        self.provider = try container.decode(TradingAccountProvider.self, forKey: .provider)
        self.spot = try container.decode(Nullable<TradingSpotAccount>.self, forKey: .spot)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.hyperliquid, forKey: .hyperliquid)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.spot, forKey: .spot)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case hyperliquid
        case id
        case object
        case provider
        case spot
        case userId = "user_id"
    }
}