import Foundation

/// The address of the user who made the payment.
public struct PaymentBillingAddress: Codable, Hashable, Sendable {
    /// The city of the address.
    public let city: Nullable<String>
    /// The country of the address.
    public let country: Nullable<String>
    /// The line 1 of the address.
    public let line1: Nullable<String>
    /// The line 2 of the address.
    public let line2: Nullable<String>
    /// The name of the customer.
    public let name: Nullable<String>
    /// The postal code of the address.
    public let postalCode: Nullable<String>
    /// The state of the address.
    public let state: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>,
        country: Nullable<String>,
        line1: Nullable<String>,
        line2: Nullable<String>,
        name: Nullable<String>,
        postalCode: Nullable<String>,
        state: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.line1 = line1
        self.line2 = line2
        self.name = name
        self.postalCode = postalCode
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.line1 = try container.decode(Nullable<String>.self, forKey: .line1)
        self.line2 = try container.decode(Nullable<String>.self, forKey: .line2)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.postalCode = try container.decode(Nullable<String>.self, forKey: .postalCode)
        self.state = try container.decode(Nullable<String>.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.line1, forKey: .line1)
        try container.encode(self.line2, forKey: .line2)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.postalCode, forKey: .postalCode)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case line1
        case line2
        case name
        case postalCode = "postal_code"
        case state
    }
}