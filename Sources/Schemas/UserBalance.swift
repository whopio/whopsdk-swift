import Foundation

public struct UserBalance: Codable, Hashable, Sendable {
    public let businesses: [UserBalanceBusiness]
    /// Combined USD balance across every account the user owns.
    public let businessesTotalUsd: String
    public let cash: [UserBalanceCash]
    /// Fiat cash in USD, including pending, in-transit, and reserve.
    public let cashUsd: String
    public let crypto: [UserBalanceToken]
    /// Crypto holdings in USD.
    public let cryptoUsd: String
    /// Fiat pending and in-transit balances, plus in-flight treasury deposits, in USD.
    public let pendingUsd: String
    /// The user's personal balance in USD: cash (available + pending + in-transit + reserve) + other holdings + deposits still in flight. Excludes account balances (see businesses_total_usd).
    public let totalUsd: String
    /// Balance moves into the user's wallet still in flight, in USD.
    public let treasuryPendingUsd: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businesses: [UserBalanceBusiness],
        businessesTotalUsd: String,
        cash: [UserBalanceCash],
        cashUsd: String,
        crypto: [UserBalanceToken],
        cryptoUsd: String,
        pendingUsd: String,
        totalUsd: String,
        treasuryPendingUsd: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businesses = businesses
        self.businessesTotalUsd = businessesTotalUsd
        self.cash = cash
        self.cashUsd = cashUsd
        self.crypto = crypto
        self.cryptoUsd = cryptoUsd
        self.pendingUsd = pendingUsd
        self.totalUsd = totalUsd
        self.treasuryPendingUsd = treasuryPendingUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businesses = try container.decode([UserBalanceBusiness].self, forKey: .businesses)
        self.businessesTotalUsd = try container.decode(String.self, forKey: .businessesTotalUsd)
        self.cash = try container.decode([UserBalanceCash].self, forKey: .cash)
        self.cashUsd = try container.decode(String.self, forKey: .cashUsd)
        self.crypto = try container.decode([UserBalanceToken].self, forKey: .crypto)
        self.cryptoUsd = try container.decode(String.self, forKey: .cryptoUsd)
        self.pendingUsd = try container.decode(String.self, forKey: .pendingUsd)
        self.totalUsd = try container.decode(String.self, forKey: .totalUsd)
        self.treasuryPendingUsd = try container.decode(String.self, forKey: .treasuryPendingUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.businesses, forKey: .businesses)
        try container.encode(self.businessesTotalUsd, forKey: .businessesTotalUsd)
        try container.encode(self.cash, forKey: .cash)
        try container.encode(self.cashUsd, forKey: .cashUsd)
        try container.encode(self.crypto, forKey: .crypto)
        try container.encode(self.cryptoUsd, forKey: .cryptoUsd)
        try container.encode(self.pendingUsd, forKey: .pendingUsd)
        try container.encode(self.totalUsd, forKey: .totalUsd)
        try container.encode(self.treasuryPendingUsd, forKey: .treasuryPendingUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businesses
        case businessesTotalUsd = "businesses_total_usd"
        case cash
        case cashUsd = "cash_usd"
        case crypto
        case cryptoUsd = "crypto_usd"
        case pendingUsd = "pending_usd"
        case totalUsd = "total_usd"
        case treasuryPendingUsd = "treasury_pending_usd"
    }
}