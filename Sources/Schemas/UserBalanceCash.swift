import Foundation

public struct UserBalanceCash: Codable, Hashable, Sendable {
    /// Available balance in the native currency.
    public let balance: Double
    /// Available balance converted to USD.
    public let balanceUsd: Double
    /// Lowercase ISO currency code, such as `usd` or `eur`.
    public let currency: String
    /// Balance moving to the user's own wallet or card, converted to USD.
    public let inTransitBalanceUsd: Double
    /// Pending balance converted to USD.
    public let pendingBalanceUsd: Double
    /// USD price per native currency unit, or `null` when no exchange rate is available.
    public let priceUsd: Nullable<Double>
    /// Reserved balance converted to USD.
    public let reserveBalanceUsd: Double
    /// Withdrawable amount in the native currency.
    public let totalWithdrawableBalance: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: Double,
        balanceUsd: Double,
        currency: String,
        inTransitBalanceUsd: Double,
        pendingBalanceUsd: Double,
        priceUsd: Nullable<Double>,
        reserveBalanceUsd: Double,
        totalWithdrawableBalance: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.balanceUsd = balanceUsd
        self.currency = currency
        self.inTransitBalanceUsd = inTransitBalanceUsd
        self.pendingBalanceUsd = pendingBalanceUsd
        self.priceUsd = priceUsd
        self.reserveBalanceUsd = reserveBalanceUsd
        self.totalWithdrawableBalance = totalWithdrawableBalance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(Double.self, forKey: .balance)
        self.balanceUsd = try container.decode(Double.self, forKey: .balanceUsd)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.inTransitBalanceUsd = try container.decode(Double.self, forKey: .inTransitBalanceUsd)
        self.pendingBalanceUsd = try container.decode(Double.self, forKey: .pendingBalanceUsd)
        self.priceUsd = try container.decode(Nullable<Double>.self, forKey: .priceUsd)
        self.reserveBalanceUsd = try container.decode(Double.self, forKey: .reserveBalanceUsd)
        self.totalWithdrawableBalance = try container.decode(Double.self, forKey: .totalWithdrawableBalance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.balanceUsd, forKey: .balanceUsd)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.inTransitBalanceUsd, forKey: .inTransitBalanceUsd)
        try container.encode(self.pendingBalanceUsd, forKey: .pendingBalanceUsd)
        try container.encode(self.priceUsd, forKey: .priceUsd)
        try container.encode(self.reserveBalanceUsd, forKey: .reserveBalanceUsd)
        try container.encode(self.totalWithdrawableBalance, forKey: .totalWithdrawableBalance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case balanceUsd = "balance_usd"
        case currency
        case inTransitBalanceUsd = "in_transit_balance_usd"
        case pendingBalanceUsd = "pending_balance_usd"
        case priceUsd = "price_usd"
        case reserveBalanceUsd = "reserve_balance_usd"
        case totalWithdrawableBalance = "total_withdrawable_balance"
    }
}