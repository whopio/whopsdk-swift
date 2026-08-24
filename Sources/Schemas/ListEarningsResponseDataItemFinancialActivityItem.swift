import Foundation

public struct ListEarningsResponseDataItemFinancialActivityItem: Codable, Hashable, Sendable {
    /// Line amount in its native currency.
    public let amount: String
    /// Line amount in USD.
    public let amountUsd: String
    /// Fee or cost category of the line.
    public let category: Nullable<String>
    public let createdAt: Nullable<Date>
    /// Currency of the native amount.
    public let currency: String
    /// Whether the line is income Whop collected or a cost Whop paid.
    public let type: ListEarningsResponseDataItemFinancialActivityItemType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        amountUsd: String,
        category: Nullable<String>,
        createdAt: Nullable<Date>,
        currency: String,
        type: ListEarningsResponseDataItemFinancialActivityItemType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.amountUsd = amountUsd
        self.category = category
        self.createdAt = createdAt
        self.currency = currency
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.amountUsd = try container.decode(String.self, forKey: .amountUsd)
        self.category = try container.decode(Nullable<String>.self, forKey: .category)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.type = try container.decode(ListEarningsResponseDataItemFinancialActivityItemType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.amountUsd, forKey: .amountUsd)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case amountUsd = "amount_usd"
        case category
        case createdAt = "created_at"
        case currency
        case type
    }
}