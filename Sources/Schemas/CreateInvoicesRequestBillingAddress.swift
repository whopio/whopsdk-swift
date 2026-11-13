import Foundation

/// Create a billing address linked to this member.
public struct CreateInvoicesRequestBillingAddress: Codable, Hashable, Sendable {
    public let city: String
    /// ISO 3166-1 alpha-2 country code.
    public let country: String
    public let line1: String
    public let line2: Nullable<String>?
    public let name: Nullable<String>?
    public let phone: Nullable<String>?
    public let postalCode: String
    public let state: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String,
        country: String,
        line1: String,
        line2: Nullable<String>? = nil,
        name: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        postalCode: String,
        state: Nullable<String>? = nil,
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
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(String.self, forKey: .city)
        self.country = try container.decode(String.self, forKey: .country)
        self.line1 = try container.decode(String.self, forKey: .line1)
        self.line2 = try container.decodeNullableIfPresent(String.self, forKey: .line2)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.line1, forKey: .line1)
        try container.encodeNullableIfPresent(self.line2, forKey: .line2)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encode(self.postalCode, forKey: .postalCode)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
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
    }
}