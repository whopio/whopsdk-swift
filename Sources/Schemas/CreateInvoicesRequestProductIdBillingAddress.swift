import Foundation

/// Inline billing address to create a new mailing address for this invoice. Cannot be used together with mailing_address_id.
public struct CreateInvoicesRequestProductIdBillingAddress: Codable, Hashable, Sendable {
    /// The city of the address.
    public let city: Nullable<String>?
    /// The country of the address.
    public let country: Nullable<String>?
    /// The line 1 of the address.
    public let line1: Nullable<String>?
    /// The line 2 of the address.
    public let line2: Nullable<String>?
    /// The name of the customer.
    public let name: Nullable<String>?
    /// The phone number of the customer.
    public let phone: Nullable<String>?
    /// The postal code of the address.
    public let postalCode: Nullable<String>?
    /// The state of the address.
    public let state: Nullable<String>?
    /// The type of tax identifier.
    public let taxIdType: Nullable<TaxIdentifierTypes>?
    /// The value of the tax identifier.
    public let taxIdValue: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        line1: Nullable<String>? = nil,
        line2: Nullable<String>? = nil,
        name: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        postalCode: Nullable<String>? = nil,
        state: Nullable<String>? = nil,
        taxIdType: Nullable<TaxIdentifierTypes>? = nil,
        taxIdValue: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.line1 = line1
        self.line2 = line2
        self.name = name
        self.phone = phone
        self.postalCode = postalCode
        self.state = state
        self.taxIdType = taxIdType
        self.taxIdValue = taxIdValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.line1 = try container.decodeNullableIfPresent(String.self, forKey: .line1)
        self.line2 = try container.decodeNullableIfPresent(String.self, forKey: .line2)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.postalCode = try container.decodeNullableIfPresent(String.self, forKey: .postalCode)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.taxIdType = try container.decodeNullableIfPresent(TaxIdentifierTypes.self, forKey: .taxIdType)
        self.taxIdValue = try container.decodeNullableIfPresent(String.self, forKey: .taxIdValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.line1, forKey: .line1)
        try container.encodeNullableIfPresent(self.line2, forKey: .line2)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
        try container.encodeNullableIfPresent(self.taxIdType, forKey: .taxIdType)
        try container.encodeNullableIfPresent(self.taxIdValue, forKey: .taxIdValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case line1
        case line2
        case name
        case phone
        case postalCode = "postal_code"
        case state
        case taxIdType = "tax_id_type"
        case taxIdValue = "tax_id_value"
    }
}