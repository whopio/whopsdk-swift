import Foundation

/// Personal address for the individual.
public struct UpdateVerificationsRequestBodyPersonalAddressPersonalAddress: Codable, Hashable, Sendable {
    public let city: Nullable<String>?
    /// Two-letter ISO 3166-1 country code, for example `US`, `DE`, or `GB`. An address in a [sanctioned country or region](/trust-and-safety/trust-safety-overview/sanctioned-countries) is rejected with the error code `address_country_sanctioned`.
    public let country: Nullable<String>?
    /// First line of the street address.
    public let line1: Nullable<String>?
    /// Second line of the street address.
    public let line2: Nullable<String>?
    /// Postal or ZIP code.
    public let postalCode: Nullable<String>?
    /// State, province, or region code, for example `CA`.
    public let state: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        line1: Nullable<String>? = nil,
        line2: Nullable<String>? = nil,
        postalCode: Nullable<String>? = nil,
        state: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.line1 = line1
        self.line2 = line2
        self.postalCode = postalCode
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.line1 = try container.decodeNullableIfPresent(String.self, forKey: .line1)
        self.line2 = try container.decodeNullableIfPresent(String.self, forKey: .line2)
        self.postalCode = try container.decodeNullableIfPresent(String.self, forKey: .postalCode)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.line1, forKey: .line1)
        try container.encodeNullableIfPresent(self.line2, forKey: .line2)
        try container.encodeNullableIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case line1
        case line2
        case postalCode = "postal_code"
        case state
    }
}