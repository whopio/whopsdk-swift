import Foundation

public struct PaymentBillingDetailsPreview: Codable, Hashable, Sendable {
    /// ISO 3166-1 alpha-2 country code.
    public let country: Nullable<String>
    /// Email supplied when the method was collected.
    public let email: Nullable<String>
    /// Name on the payment method.
    public let name: Nullable<String>
    /// Postal or ZIP code.
    public let postalCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: Nullable<String>,
        email: Nullable<String>,
        name: Nullable<String>,
        postalCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.email = email
        self.name = name
        self.postalCode = postalCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.postalCode = try container.decode(Nullable<String>.self, forKey: .postalCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.postalCode, forKey: .postalCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case email
        case name
        case postalCode = "postal_code"
    }
}