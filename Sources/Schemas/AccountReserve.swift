import Foundation

public struct AccountReserve: Codable, Hashable, Sendable {
    /// Total held in this currency, in native units, as a decimal string. `usd` and `usdt` are reported as one `usd` entry, matching how the balance row groups them.
    public let amount: String
    public let byType: [AccountReserveType]
    /// Lowercase ISO currency code, such as `usd` or `eur`.
    public let currency: String
    public let unlocksByDate: [AccountReserveUnlock]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        byType: [AccountReserveType],
        currency: String,
        unlocksByDate: [AccountReserveUnlock],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.byType = byType
        self.currency = currency
        self.unlocksByDate = unlocksByDate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.byType = try container.decode([AccountReserveType].self, forKey: .byType)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.unlocksByDate = try container.decode([AccountReserveUnlock].self, forKey: .unlocksByDate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.byType, forKey: .byType)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.unlocksByDate, forKey: .unlocksByDate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case byType = "by_type"
        case currency
        case unlocksByDate = "unlocks_by_date"
    }
}