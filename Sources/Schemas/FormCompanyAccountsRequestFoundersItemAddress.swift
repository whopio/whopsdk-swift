import Foundation

/// Founder's personal address.
public struct FormCompanyAccountsRequestFoundersItemAddress: Codable, Hashable, Sendable {
    public let city: String
    /// Two-letter ISO 3166-1 country code, for example `US`.
    public let country: String
    /// First line of the street address.
    public let line1: String
    /// Second line of the street address.
    public let line2: String?
    /// Postal or ZIP code.
    public let postalCode: String
    /// State or region code, for example `CA`.
    public let state: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String,
        country: String,
        line1: String,
        line2: String? = nil,
        postalCode: String,
        state: String,
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
        self.city = try container.decode(String.self, forKey: .city)
        self.country = try container.decode(String.self, forKey: .country)
        self.line1 = try container.decode(String.self, forKey: .line1)
        self.line2 = try container.decodeIfPresent(String.self, forKey: .line2)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
        self.state = try container.decode(String.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.line1, forKey: .line1)
        try container.encodeIfPresent(self.line2, forKey: .line2)
        try container.encode(self.postalCode, forKey: .postalCode)
        try container.encode(self.state, forKey: .state)
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