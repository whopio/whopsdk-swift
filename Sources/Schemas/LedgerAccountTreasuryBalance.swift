import Foundation

/// The balance cache associated with the account by currency.
public struct LedgerAccountTreasuryBalance: Codable, Hashable, Sendable {
    /// The amount of the balance.
    public let balance: Double
    /// The balance converted to USD.
    public let balanceUsd: Double
    /// The currency of the balance.
    public let currency: Currencies
    /// The amount of the balance that is pending.
    public let pendingBalance: Double
    /// The amount of the balance that is reserved.
    public let reserveBalance: Double
    /// The amount of the balance that is withdrawable.
    public let totalWithdrawableBalance: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: Double,
        balanceUsd: Double,
        currency: Currencies,
        pendingBalance: Double,
        reserveBalance: Double,
        totalWithdrawableBalance: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.balanceUsd = balanceUsd
        self.currency = currency
        self.pendingBalance = pendingBalance
        self.reserveBalance = reserveBalance
        self.totalWithdrawableBalance = totalWithdrawableBalance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(Double.self, forKey: .balance)
        self.balanceUsd = try container.decode(Double.self, forKey: .balanceUsd)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.pendingBalance = try container.decode(Double.self, forKey: .pendingBalance)
        self.reserveBalance = try container.decode(Double.self, forKey: .reserveBalance)
        self.totalWithdrawableBalance = try container.decode(Double.self, forKey: .totalWithdrawableBalance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.balanceUsd, forKey: .balanceUsd)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.pendingBalance, forKey: .pendingBalance)
        try container.encode(self.reserveBalance, forKey: .reserveBalance)
        try container.encode(self.totalWithdrawableBalance, forKey: .totalWithdrawableBalance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case balanceUsd = "balance_usd"
        case currency
        case pendingBalance = "pending_balance"
        case reserveBalance = "reserve_balance"
        case totalWithdrawableBalance = "total_withdrawable_balance"
    }
}