import Foundation

public struct ListEarningsResponseDataItemResourceAlternativePaymentMethod: Codable, Hashable, Sendable {
    public let alternativePaymentMethod: Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>
    public let brand: Nullable<String>
    public let createdAt: Date
    public let currency: String
    public let id: String
    public let last4: Nullable<String>
    public let object: ListEarningsResponseDataItemResourceAlternativePaymentMethodObject
    public let paymentMethodType: Nullable<String>
    public let processor: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        alternativePaymentMethod: Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>,
        brand: Nullable<String>,
        createdAt: Date,
        currency: String,
        id: String,
        last4: Nullable<String>,
        object: ListEarningsResponseDataItemResourceAlternativePaymentMethodObject,
        paymentMethodType: Nullable<String>,
        processor: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.alternativePaymentMethod = alternativePaymentMethod
        self.brand = brand
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.last4 = last4
        self.object = object
        self.paymentMethodType = paymentMethodType
        self.processor = processor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.alternativePaymentMethod = try container.decode(Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>.self, forKey: .alternativePaymentMethod)
        self.brand = try container.decode(Nullable<String>.self, forKey: .brand)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.object = try container.decode(ListEarningsResponseDataItemResourceAlternativePaymentMethodObject.self, forKey: .object)
        self.paymentMethodType = try container.decode(Nullable<String>.self, forKey: .paymentMethodType)
        self.processor = try container.decode(Nullable<String>.self, forKey: .processor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.alternativePaymentMethod, forKey: .alternativePaymentMethod)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.last4, forKey: .last4)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.processor, forKey: .processor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case alternativePaymentMethod = "alternative_payment_method"
        case brand
        case createdAt = "created_at"
        case currency
        case id
        case last4
        case object
        case paymentMethodType = "payment_method_type"
        case processor
    }
}