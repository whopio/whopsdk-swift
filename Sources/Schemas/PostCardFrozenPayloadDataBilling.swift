import Foundation

/// The billing address.
public struct PostCardFrozenPayloadDataBilling: Codable, Hashable, Sendable {
    /// Billing city.
    public let city: Nullable<String>
    /// Billing country code.
    public let countryCode: Nullable<String>
    /// Street address line 1.
    public let line1: Nullable<String>
    /// Street address line 2.
    public let line2: Nullable<String>
    /// Billing postal code.
    public let postalCode: Nullable<String>
    /// Billing region or state.
    public let region: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>,
        countryCode: Nullable<String>,
        line1: Nullable<String>,
        line2: Nullable<String>,
        postalCode: Nullable<String>,
        region: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.countryCode = countryCode
        self.line1 = line1
        self.line2 = line2
        self.postalCode = postalCode
        self.region = region
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.countryCode = try container.decode(Nullable<String>.self, forKey: .countryCode)
        self.line1 = try container.decode(Nullable<String>.self, forKey: .line1)
        self.line2 = try container.decode(Nullable<String>.self, forKey: .line2)
        self.postalCode = try container.decode(Nullable<String>.self, forKey: .postalCode)
        self.region = try container.decode(Nullable<String>.self, forKey: .region)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.line1, forKey: .line1)
        try container.encode(self.line2, forKey: .line2)
        try container.encode(self.postalCode, forKey: .postalCode)
        try container.encode(self.region, forKey: .region)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case countryCode = "country_code"
        case line1
        case line2
        case postalCode = "postal_code"
        case region
    }
}