import Foundation

public struct ListEventsResponseDataItemRelatedVariant: Codable, Hashable, Sendable {
    public let billingPeriod: Nullable<Int>?
    public let currency: Nullable<String>?
    public let id: String?
    public let initialPrice: Nullable<Double>?
    public let renewalPrice: Nullable<Double>?
    public let title: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingPeriod: Nullable<Int>? = nil,
        currency: Nullable<String>? = nil,
        id: String? = nil,
        initialPrice: Nullable<Double>? = nil,
        renewalPrice: Nullable<Double>? = nil,
        title: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.id = id
        self.initialPrice = initialPrice
        self.renewalPrice = renewalPrice
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
        self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
        try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingPeriod = "billing_period"
        case currency
        case id
        case initialPrice = "initial_price"
        case renewalPrice = "renewal_price"
        case title
    }
}