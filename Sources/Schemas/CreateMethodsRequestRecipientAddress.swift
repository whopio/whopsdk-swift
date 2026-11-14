import Foundation

/// The recipient's address in recipient.country. Saved on the recipient payout account and supplied to bank methods that require address fields. Omit to retain the existing address when reusing a recipient.
public struct CreateMethodsRequestRecipientAddress: Codable, Hashable, Sendable {
    /// The recipient's city.
    public let city: String
    /// The recipient's street address.
    public let line1: String
    /// Apartment, suite or unit.
    public let line2: String?
    /// The recipient's postal or ZIP code.
    public let postalCode: String?
    /// The recipient's state, province or region.
    public let state: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String,
        line1: String,
        line2: String? = nil,
        postalCode: String? = nil,
        state: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.line1 = line1
        self.line2 = line2
        self.postalCode = postalCode
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(String.self, forKey: .city)
        self.line1 = try container.decode(String.self, forKey: .line1)
        self.line2 = try container.decodeIfPresent(String.self, forKey: .line2)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.line1, forKey: .line1)
        try container.encodeIfPresent(self.line2, forKey: .line2)
        try container.encodeIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeIfPresent(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case line1
        case line2
        case postalCode = "postal_code"
        case state
    }
}