import Foundation

public struct DomainAvailability: Codable, Hashable, Sendable {
    /// Whether the domain can be registered now.
    public let available: Bool
    /// Whether the registry charges more than its standard price for this domain.
    public let premium: Bool
    /// What the first year of registration costs. `null` when the domain is not available.
    public let price: Nullable<Money>
    /// What each yearly renewal costs after the first year. `null` when the domain is not available.
    public let renewalPrice: Nullable<Money>
    /// How desirable the domain is, from 0 to 100. Short, real-word names on well-known extensions score highest.
    public let score: Int
    /// What moving the domain to Whop costs if it's registered elsewhere, including the year it adds to the domain's registration. `null` when it's available or can't be transferred.
    public let transferPrice: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        available: Bool,
        premium: Bool,
        price: Nullable<Money>,
        renewalPrice: Nullable<Money>,
        score: Int,
        transferPrice: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.available = available
        self.premium = premium
        self.price = price
        self.renewalPrice = renewalPrice
        self.score = score
        self.transferPrice = transferPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.available = try container.decode(Bool.self, forKey: .available)
        self.premium = try container.decode(Bool.self, forKey: .premium)
        self.price = try container.decode(Nullable<Money>.self, forKey: .price)
        self.renewalPrice = try container.decode(Nullable<Money>.self, forKey: .renewalPrice)
        self.score = try container.decode(Int.self, forKey: .score)
        self.transferPrice = try container.decode(Nullable<Money>.self, forKey: .transferPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.available, forKey: .available)
        try container.encode(self.premium, forKey: .premium)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.transferPrice, forKey: .transferPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case available
        case premium
        case price
        case renewalPrice = "renewal_price"
        case score
        case transferPrice = "transfer_price"
    }
}