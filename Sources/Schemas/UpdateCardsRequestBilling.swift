import Foundation

/// New billing address. Requires line1, city, region, postal_code, and country_code. On an invited card, passing billing alone (as the invited user) completes onboarding and starts card provisioning.
public struct UpdateCardsRequestBilling: Codable, Hashable, Sendable {
    /// Billing city.
    public let city: String
    /// Billing country code, ISO 3166-1 alpha-2.
    public let countryCode: String
    /// Street address line 1.
    public let line1: String
    /// Street address line 2.
    public let line2: String?
    /// Billing postal code.
    public let postalCode: String
    /// Billing region or state.
    public let region: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String,
        countryCode: String,
        line1: String,
        line2: String? = nil,
        postalCode: String,
        region: String,
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
        self.city = try container.decode(String.self, forKey: .city)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.line1 = try container.decode(String.self, forKey: .line1)
        self.line2 = try container.decodeIfPresent(String.self, forKey: .line2)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
        self.region = try container.decode(String.self, forKey: .region)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.line1, forKey: .line1)
        try container.encodeIfPresent(self.line2, forKey: .line2)
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