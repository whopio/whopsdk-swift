import Foundation

public struct ShippingAddressChangedWebhookAddress: Codable, Hashable, Sendable {
    /// The city.
    public let city: Nullable<String>
    /// The two-letter ISO 3166-1 country code.
    public let country: Nullable<String>
    /// The postal code.
    public let postalCode: Nullable<String>
    /// The state, province or region code.
    public let state: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>,
        country: Nullable<String>,
        postalCode: Nullable<String>,
        state: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.postalCode = postalCode
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.postalCode = try container.decode(Nullable<String>.self, forKey: .postalCode)
        self.state = try container.decode(Nullable<String>.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.postalCode, forKey: .postalCode)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case postalCode = "postal_code"
        case state
    }
}