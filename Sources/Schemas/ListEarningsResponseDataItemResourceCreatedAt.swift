import Foundation

public struct ListEarningsResponseDataItemResourceCreatedAt: Codable, Hashable, Sendable {
    public let createdAt: Date
    public let currency: Nullable<String>
    public let id: String
    public let merchantName: Nullable<String>
    public let object: ListEarningsResponseDataItemResourceCreatedAtObject
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        currency: Nullable<String>,
        id: String,
        merchantName: Nullable<String>,
        object: ListEarningsResponseDataItemResourceCreatedAtObject,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.merchantName = merchantName
        self.object = object
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<String>.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.merchantName = try container.decode(Nullable<String>.self, forKey: .merchantName)
        self.object = try container.decode(ListEarningsResponseDataItemResourceCreatedAtObject.self, forKey: .object)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.merchantName, forKey: .merchantName)
        try container.encode(self.object, forKey: .object)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case currency
        case id
        case merchantName = "merchant_name"
        case object
    }
}