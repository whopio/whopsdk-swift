import Foundation

/// A cached balance for a LedgerAccount in respect to a currency.
public struct LedgerAccountBalancesItem: Codable, Hashable, Sendable {
    /// The amount of the balance.
    public let balance: Double
    /// The currency of the balance.
    public let currency: Currencies
    /// The amount of the balance that is pending.
    public let pendingBalance: Double
    /// The amount of the balance that is reserved.
    public let reserveBalance: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: Double,
        currency: Currencies,
        pendingBalance: Double,
        reserveBalance: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.currency = currency
        self.pendingBalance = pendingBalance
        self.reserveBalance = reserveBalance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(Double.self, forKey: .balance)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.pendingBalance = try container.decode(Double.self, forKey: .pendingBalance)
        self.reserveBalance = try container.decode(Double.self, forKey: .reserveBalance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.pendingBalance, forKey: .pendingBalance)
        try container.encode(self.reserveBalance, forKey: .reserveBalance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case currency
        case pendingBalance = "pending_balance"
        case reserveBalance = "reserve_balance"
    }
}